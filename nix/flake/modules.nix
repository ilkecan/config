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

  inherit (lib._.ilkecan)
    importTree
    ;
in
{
  flake.modules = importTree {
    root = "${self}/nix/modules";
    depth = 2;
    importFn = id;
    normalizeNameFn = x: toCamelCase (removeSuffix ".nix" x);
  };
}
