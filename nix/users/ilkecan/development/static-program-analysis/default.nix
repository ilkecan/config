{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  home.packages = with pkgs; [
    keep-sorted # https://github.com/google/keep-sorted
    treefmt # https://github.com/numtide/treefmt
  ];
}
