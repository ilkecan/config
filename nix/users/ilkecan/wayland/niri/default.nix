{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.niri;

  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    # https://github.com/YaLTeR/niri/blob/main/resources/default-config.kdl
    settings = {
      hotkey-overlay = {
        skip-at-startup = true; # https://niri-wm.github.io/niri/Configuration:-Miscellaneous.html#skip-at-startup
      };
      prefer-no-csd = true; # https://niri-wm.github.io/niri/Configuration:-Miscellaneous.html#prefer-no-csd
    };
  };

  xdg.portal.configPackages = [ cfg.package ];
}
