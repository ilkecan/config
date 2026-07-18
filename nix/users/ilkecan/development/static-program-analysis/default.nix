{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

  home.packages = with pkgs; [
    keep-sorted # https://github.com/google/keep-sorted
    treefmt # https://github.com/numtide/treefmt
  ];
}
