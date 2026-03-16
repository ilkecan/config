{
  lib,
}:

let
  inherit (builtins)
    attrNames
    baseNameOf
    convertHash
    pathExists
    readDir
    hashString
    ;

  inherit (lib)
    filterAttrs
    hasSuffix
    id
    isAttrs
    isPath
    mapAttrs'
    nameValuePair
    substring
    ;

  inherit (lib.my)
    importTree
    mkAbsolute
    storePathName
    ;

  INFINITY = 1.0e308 * 2;
in
{
  collectImports =
    dir:
    let
      isImportable =
        name: type:
        if type == "directory" then
          pathExists (dir + "/${name}/default.nix")
        else
          hasSuffix ".nix" name && name != "default.nix";
      entries = filterAttrs isImportable (readDir dir);
    in
    map (name: dir + "/${name}") (attrNames entries);

  flakeInputStorePath =
    { narHash, ... }:
    let
      narHashHex = convertHash {
        hash = narHash;
        toHashFormat = "base16";
      };

      # The fingerprint Nix uses for source (content-addressed) paths
      fingerprint = "source:sha256:${narHashHex}:/nix/store:source";

      fullHashHex = hashString "sha256" fingerprint;

      # Nix truncates to 160 bits (20 bytes = 40 hex chars)
      truncatedHex = substring 0 40 fullHashHex;

      # Trick: sha1 is also 160 bits, so convertHash will accept
      # our 40-char hex string and produce the correct nix32 encoding
      storeHash = convertHash {
        hash = truncatedHex;
        hashAlgo = "sha1";
        toHashFormat = "nix32";
      };
    in
    "/nix/store/${storeHash}-source";

  flattenAttrs =
    sep: attrs:
    let
      flatten =
        prefix: attrs:
        lib.foldlAttrs (
          acc: name: value:
          let
            name' = if prefix == "" then name else "${prefix}${sep}${name}";
          in
          if isAttrs value then acc // flatten name' value else acc // { ${name'} = value; }
        ) { } attrs;
    in
    flatten "" attrs;

  importTree =
    {
      root,

      depth ? INFINITY,
      # NOTE: Prefer `importApply` over bare `import` when a module expression
      # is required. If there is no extra arguments to be passed, file path
      # (`importFn = id`) is also preferable to `import`.
      # https://noogle.dev/f/lib/modules/importApply
      importFn ? import,
      normalizeNameFn ? id,
    }:
    let
      importFile = path: importFn (mkAbsolute root path);
      importDir =
        path:
        mapAttrs' (
          name: type:
          let
            name' = normalizeNameFn name;
            value =
              if type == "directory" then
                importTree {
                  root = mkAbsolute root name;
                  depth = depth - 1;
                  inherit normalizeNameFn importFn;
                }
              else
                importFile name;
          in
          nameValuePair name' value
        ) (readDir path);
    in
    if depth <= 0 then importFile root else importDir root;

  isFlake = x: x._type or null == "flake";

  isPatchedInput = x: storePathName x != "source";

  mkAbsolute =
    root: path:
    if isPath path then
      path
    else
      let
        path' = toString path;
        firstChar = substring 0 1 path';
      in
      if firstChar == "/" then path' else root + "/${path'}";

  storePathName = path: substring 33 (-1) (baseNameOf path);
}
