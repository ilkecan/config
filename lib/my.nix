{
  lib,
}:

let
  inherit (builtins)
    readDir
  ;

  inherit (lib)
    isPath
    mapAttrs
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
      importFn ? import,
    }:
    let
      importFile = path:
        importFn (relativeTo root path);
      importDir = path:
        mapAttrs (name: type:
          if type == "directory" then
            importTree { root = relativeTo root name; depth = depth - 1; inherit importFn; }
          else
            importFile name
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
      root + "/${toString path}"
    ;
}
