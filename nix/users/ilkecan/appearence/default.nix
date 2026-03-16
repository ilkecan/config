{
  config,
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

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    targets.firefox.profileNames = [ config.home.username ];
  };
}
