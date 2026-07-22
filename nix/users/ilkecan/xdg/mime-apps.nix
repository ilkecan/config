{
  config,
  pkgs,
  ...
}:

{
  # https://wiki.archlinux.org/title/XDG_MIME_Applications
  xdg.mimeApps = {
    enable = true;

    defaultApplicationPackages = with pkgs; [
      config.programs.mpv.package
      config.programs.imv.package
      # config.programs.feh.package
      config.programs.firefox.package
      config.programs.zathura.package
      neovide
      vlc
    ];
  };
}
