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

  importDir = root:
    importTree {
      inherit root;
      depth = 1;
      normalizeNameFn = x: toCamelCase (removeSuffix ".nix" x);
      importFn = id;
    };
in
{
  flake.modules = {
    flake = importDir "${self}/modules/flake";
  };
}
