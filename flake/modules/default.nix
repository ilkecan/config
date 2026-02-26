{
  lib,
  ...
}:

let
  inherit (lib)
    toCamelCase
    removeSuffix
  ;

  inherit (lib.my)
    importTree
  ;

  importDir = root:
    importTree { inherit root; depth = 1; normalizeNameFn = x: toCamelCase (removeSuffix ".nix" x); };
in
{
  flake.modules = {
    flake = importDir ./flake;
  };
}
