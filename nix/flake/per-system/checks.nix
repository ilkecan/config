{
  lib,
  self,
  ...
}:

let
  inherit (lib)
    removeSuffix
    ;

  inherit (lib.my)
    importTree
    ;
in
{
  perSystem =
    { pkgs, ... }:
    {
      checks = importTree {
        root = ./checks;
        depth = 1;
        importFn = x: import x { inherit pkgs self; };
        normalizeNameFn = removeSuffix ".nix";
      };
    };
}
