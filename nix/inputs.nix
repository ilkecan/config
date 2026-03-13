{
  inputs,
  lib,
}:

let
  inherit (builtins)
    unsafeDiscardStringContext
    ;

  inherit (lib)
    map
    mapAttrs
    mapAttrs'
    nameValuePair
    removeSuffix
    ;

  inherit (lib.my)
    importTree
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
      inputs' = mapAttrs (_: resolveInput) src.inputs;
    };

  inherit (inputs) self;
  inputs' = removeAttrs inputs [ "self" ];

  patchedInputs = importTree {
    root = ./inputs;
    depth = 1;
    importFn = x: patchInput (import x);
    normalizeNameFn = removeSuffix ".nix";
  };

  # Use the original realized source path as the replacement identity so
  # aliases such as nixpkgs-lib and nixpkgs-stable collapse to one node.
  inputKey = x: unsafeDiscardStringContext x.outPath;

  # Rebuild a non-patched flake against resolved child inputs.
  # Top-level canonical inputs are handled separately through replacementMapping.
  resolveFlake =
    input:
    if input ? inputs then
      mkFlake {
        srcPath = input.outPath;
        sourceInfo = input.sourceInfo;
        inputs' = mapAttrs (_: resolveInput) input.inputs;
      }
    else
      input;

  # These are the canonical nodes for every raw top-level input. Any transitive
  # dependency that is shared across the graph is expected to follow one of
  # these exact top-level nodes.
  resolvedTopLevel = mapAttrs (name: input: patchedInputs.${name} or (resolveFlake input)) inputs';

  # Map each original top-level source identity to its canonical resolved node.
  # This only covers raw top-level inputs: additive patched inputs such as
  # nixpkgs-patched are intentionally excluded because their pre-patch source
  # identity collides with another raw input (for example nixpkgs-unstable),
  # and they are only meant to be consumed directly by self.
  replacementMapping = mapAttrs' (
    name: input: nameValuePair (inputKey input) (resolvedTopLevel.${name})
  ) inputs';

  # Repository invariant: if a dependency is shared in multiple places, it
  # should have a canonical representative at the top level and all repeats
  # should follow that node. In that common case we reuse the canonical thunk
  # through replacementMapping; the fallback only rebuilds non-canonical inputs
  # that are not expected to be shared transitively.
  resolveInput = input: replacementMapping.${inputKey input} or (resolveFlake input);

  # to include additive patched inputs like `nixpkgs-patched`
  resolvedInputs = patchedInputs // resolvedTopLevel;
in
{
  self = self // {
    inputs = resolvedInputs;
  };
}
// resolvedInputs
