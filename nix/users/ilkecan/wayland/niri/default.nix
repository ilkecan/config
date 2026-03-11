{
  config,
  pkgs,
  ...
}:

let
  cfg = config.programs.niri;
in
{
  imports = [
    ./autostart.nix
    ./binds
    ./input.nix
    ./layout.nix
    ./window-rules.nix
    ./workspaces
  ];

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
