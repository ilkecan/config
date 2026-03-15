{
  inputs,
  lib,
}:

let
  inherit (lib)
    any
    attrNames
    attrValues
    elem
    filterAttrs
    foldl'
    importJSON
    intersectAttrs
    isString
    map
    mapAttrs
    mapAttrs'
    nameValuePair
    removeSuffix
    ;

  inherit (lib.my)
    importTree
    isFlake
    isPatchedInput
    ;

  # NOTE: unfortunately there is no way to avoid hard-coded `system` yet
  # https://github.com/NixOS/nix/issues/3920
  system = "x86_64-linux";
  inherit (inputs.nixpkgs.legacyPackages.${system})
    applyPatches
    fetchpatch2
    ;

  # Reconstruct a flake from a source path and an already-resolved input set.
  # This is what keeps flake outputs consistent with rewritten transitive inputs.
  mkFlake =
    {
      srcPath,
      sourceInfo,
      inputs',
    }:
    let
      flake = import "${srcPath}/flake.nix";
      outputs = flake.outputs ({ inherit self; } // inputs');
      self =
        outputs
        // sourceInfo
        // {
          _type = "flake";
          inputs = inputs';
          inherit sourceInfo outputs;
        };
    in
    self;

  # Apply local patches to a top-level input, then rebuild its outputs against
  # the canonical resolved graph rather than the original upstream inputs.
  patchInput =
    {
      owner,
      repo,
      name,
      pulls,
      input ? name,
      patches ? [ ],
    }:
    let
      mkPatch =
        { number, hash }:
        fetchpatch2 {
          inherit hash;
          name = "${owner}-${repo}-${number}.patch";
          url = "https://github.com/${owner}/${repo}/pull/${number}.diff?full_index=1";
        };

      src = inputs.${input};
      src' = applyPatches {
        inherit name src;
        patches = patches ++ map mkPatch pulls;
      };

      sourceInfo = src.sourceInfo // {
        inherit (src') outPath;
      };
    in
    mkFlake {
      srcPath = src';
      inherit sourceInfo;
      inputs' = mapAttrs (
        localName: resolveInput (resolveNodeName nodes.${topLevelNodeNames.${input}}.inputs.${localName})
      ) src.inputs;
    };

  # Patch configurations from ./inputs/ that actually apply changes. importFn
  # calls patchInput for every spec file; isPatchedInput filters out specs with
  # no patches (where applyPatches returns the original src unchanged).
  patchedInputs = filterAttrs (_: isPatchedInput) (importTree {
    root = ./inputs;
    depth = 1;
    importFn = x: patchInput (import x);
    normalizeNameFn = removeSuffix ".nix";
  });

  # Resolve a lock node reference to its canonical node name.
  # String refs are already node names; array refs are follow-paths from root
  # (e.g. ["nixpkgs"] resolves root→nixpkgs, ["bar","foo"] resolves root→bar→foo).
  resolveNodeName =
    inputSpec:
    if isString inputSpec then
      inputSpec
    else
      foldl' (nodeName: inputName: resolveNodeName nodes.${nodeName}.inputs.${inputName}) root inputSpec;

  lockFile = importJSON ../flake.lock;
  inherit (lockFile) nodes root;

  rootInputs = nodes.${root}.inputs;
  resolveTopLevelNodeName = name: resolveNodeName rootInputs.${name};

  inputs' = removeAttrs inputs [ "self" ];

  # Node key for each top-level input (resolved via lock, not outPath).
  topLevelNodeNames = mapAttrs (name: _: resolveTopLevelNodeName name) inputs';

  # Shadowed inputs are those whose name also appears in inputs'. Additive
  # patches (e.g. nixpkgs-patched) are excluded — they add a name not present
  # in inputs', so they have no corresponding lock node to mark dirty.
  shadowedInputNames = attrNames (intersectAttrs inputs' patchedInputs);
  shadowedNodeNames = map resolveTopLevelNodeName shadowedInputNames;

  # Self-referential lazy map: a lock node is dirty if it is directly patched
  # or any of its lock-declared inputs resolves to a dirty node.
  # Terminates because flake.lock is a DAG. Pattern validated by Nix's own
  # call-flake.nix (allNodes), adapted here with a nodeDirtiness check instead
  # of unconditionally rebuilding everything.
  nodeDirtiness = mapAttrs (
    name: node:
    elem name shadowedNodeNames
    || any (inputSpec: nodeDirtiness.${resolveNodeName inputSpec}) (attrValues (node.inputs or { }))
  ) nodes;

  # Rebuild a dirty flake against resolved child inputs. Each child's lock node
  # name is used to look up its canonical resolved version via resolveInput.
  resolveFlake =
    nodeName: input:
    if isFlake input then
      mkFlake {
        srcPath = input.outPath;
        sourceInfo = input.sourceInfo;
        inputs' = mapAttrs (
          localName: resolveInput (resolveNodeName nodes.${nodeName}.inputs.${localName})
        ) input.inputs;
      }
    else
      input;

  # Canonical resolved version of every raw top-level input: patched inputs use
  # their patched version; dirty inputs are rebuilt via resolveFlake; clean
  # inputs are returned as-is (no mkFlake, no flake.outputs re-evaluation).
  resolvedTopLevel = mapAttrs (
    name: input:
    patchedInputs.${name} or (
      let
        nodeName = topLevelNodeNames.${name};
      in
      if nodeDirtiness.${nodeName} then resolveFlake nodeName input else input
    )
  ) inputs';

  # Maps each top-level input's lock node name → its canonical resolved version.
  # Transitive followers share the same lock node name, so they get the same thunk.
  nodeNameMapping = mapAttrs' (
    name: _: nameValuePair topLevelNodeNames.${name} resolvedTopLevel.${name}
  ) inputs';

  # Resolve any input by its lock node name to its canonical version.
  # Top-level canonical nodes are served from nodeNameMapping; transitive
  # non-canonical nodes fall back to resolveFlake if dirty, or are returned
  # as-is if clean.
  resolveInput =
    nodeName: input:
    nodeNameMapping.${nodeName}
      or (if nodeDirtiness.${nodeName} then resolveFlake nodeName input else input);

  # Merges additive patched inputs (e.g. nixpkgs-patched) with the resolved
  # top-level inputs. Additive inputs are not present in inputs' so they would
  # otherwise be dropped; this merge ensures they are exported alongside the rest.
  resolvedInputs = patchedInputs // resolvedTopLevel;
in
{
  self = inputs.self // {
    inputs = resolvedInputs;
  };
}
// resolvedInputs
