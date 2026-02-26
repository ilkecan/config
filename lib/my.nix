{
  lib,
}:

let
  inherit (builtins)
    readDir
  ;

  inherit (lib)
    id
    isPath
    mapAttrs'
    nameValuePair
    substring
  ;

  inherit (lib.my)
    importTree
    relativeTo
  ;

  INFINITY = 1.0e308 * 2;
in
{
  importTree =
    {
      root,
      depth ? INFINITY,
      normalizeNameFn ? id,

      # NOTE: Prefer `importApply` over bare `import` when a module expression
      # is required. If there is no extra arguments to be passed, file path
      # (`importFn = id`) is also preferable to `import`.
      # https://noogle.dev/f/lib/modules/importApply
      importFn ? import,
    }:
    let
      importFile = path:
        importFn (relativeTo root path);
      importDir = path:
        mapAttrs' (name: type:
          let
            name' = normalizeNameFn name;
            value =
              if type == "directory" then
                importTree { root = relativeTo root name; depth = depth - 1; inherit normalizeNameFn importFn; }
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

  relativeTo = root: path:
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
