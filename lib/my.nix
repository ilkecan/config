{
  lib,
}:

let
  inherit (builtins)
    readDir
  ;

  inherit (lib)
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
  ;

  INFINITY = 1.0e308 * 2;
in
{
  flattenAttrs = sep: attrs:
    let
      flatten = prefix: attrs:
        lib.foldlAttrs (acc: name: value:
          let
            name' = if prefix == "" then name else "${prefix}${sep}${name}";
          in
          if isAttrs value then
            acc // flatten name' value
          else
            acc // { ${name'} = value; }
        ) {} attrs;
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
      importFile = path:
        importFn (mkAbsolute root path);
      importDir = path:
        mapAttrs' (name: type:
          let
            name' = normalizeNameFn name;
            value =
              if type == "directory" then
                importTree { root = mkAbsolute root name; depth = depth - 1; inherit normalizeNameFn importFn; }
              else
                importFile name
              ;
          in
          nameValuePair name' value
        ) (readDir path);
    in
    if depth <= 0 then
      importFile root
    else
      importDir root
    ;

  mkAbsolute = root: path:
    if isPath path then
      path
    else
      let
        path' = toString path;
        firstChar = substring 0 1 path';
      in
      if firstChar == "/" then
        path'
      else
        root + "/${path'}"
    ;
}
