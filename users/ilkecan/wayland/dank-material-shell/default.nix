{
  config,
  inputs',
  pkgs,
  self',
  ...
}:

let
  niriBindsRelPath = "niri/dms/binds.kdl";
  user = config.home.username;
in
{
  imports = [
    ./plugins
  ];

  home.packages = with pkgs; [
    unstable.dsearch
  ];

  programs.dank-material-shell = {
    enable = true;
    package = inputs'.dms.packages.dms-shell.overrideAttrs { vendorHash = "sha256-cVUJXgzYMRSM0od1xzDVkMTdxHu3OIQX2bQ8AJbGQ1Q="; };

    dgop.package = pkgs.unstable.dgop;

    # Core features
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
    };

    niri = {
    };

    clipboardSettings = {
    };

    session = {
    };

    settings = {
    };
  };

  xdg.configFile.${niriBindsRelPath}.source = "${self'}/users/${user}/dotfiles/.config/${niriBindsRelPath}";
}
