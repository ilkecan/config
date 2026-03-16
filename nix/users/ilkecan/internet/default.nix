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
    bandwhich # https://github.com/imsnif/bandwhich
  ];
}
