{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.niri;

  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

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

  # The unit comes from the package, so override it with a drop-in. The package
  # doesn't set OOMPolicy, so it falls back to systemd's DefaultOOMPolicy=stop,
  # which tears down the whole session when any process in the unit is
  # OOM-killed (e.g. an app niri failed to move into its own scope).
  xdg.configFile."systemd/user/niri.service.d/oom-policy.conf".text = ''
    [Service]
    OOMPolicy=continue
  '';
}
