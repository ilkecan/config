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
      importFn = id;
      normalizeNameFn = x: toCamelCase (removeSuffix ".nix" x);
    };
in
{
  flake.modules = {
    flake = importDir "${self}/modules/flake";
    homeManager = importDir "${self}/modules/home-manager";
    nixos = importDir "${self}/modules/nixos";
  };
}
