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
    };
  };

  xdg.portal.configPackages = [ cfg.package ];
}
