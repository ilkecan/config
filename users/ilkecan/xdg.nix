{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;
    autostart = {
      enable = true;
      readOnly = !true;   # stylix doesn't use `entries` as of `release-25.11`, which result in a failure when `readOnly` is enabled
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = with pkgs; [
        vlc
        config.programs.mpv.package
        config.programs.imv.package
        # config.programs.feh.package
        config.programs.firefox.package
        config.programs.zathura.package
      ];
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gnome # for screencasting
        xdg-desktop-portal-gtk
      ];
    };
    terminal-exec.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
