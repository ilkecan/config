{
  lib,
  self,
  ...
}:

let
  inherit (lib)
    id
    removeSuffix
    toCamelCase
  ;

  inherit (lib.my)
    importTree
  ;
in
{
  flake.modules = importTree {
    root = "${self}/modules";
    depth = 2;
    importFn = id;
    normalizeNameFn = x: toCamelCase (removeSuffix ".nix" x);
  };
}
