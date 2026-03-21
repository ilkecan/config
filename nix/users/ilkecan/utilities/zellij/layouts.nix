{
  config,
  lib,
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
  programs.zellij.layouts = importTree {
    root = ./layouts;
    depth = 1;
    importFn = x: import x { inherit config; };
    normalizeNameFn = removeSuffix ".nix";
  };
}
