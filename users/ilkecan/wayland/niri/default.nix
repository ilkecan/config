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
    ./binds
    ./input.nix
    ./layout.nix
    ./window-rules.nix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    # https://github.com/YaLTeR/niri/blob/main/resources/default-config.kdl
    settings = {
      spawn-at-startup = [
        { argv = [ "solaar" "--window=hide" ]; }
      ];
    };
  };

  xdg.portal.configPackages = [ cfg.package ];
}
