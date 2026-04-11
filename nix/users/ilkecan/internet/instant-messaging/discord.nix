{
  pkgs,
  ...
}:

{
  programs.nixcord = {
    enable = true;
    dorion = {
      enable = true;
      package = pkgs.unstable.dorion; # NOTE: building the default package fails with: substituteInPlace called without any files to operate on (files must come before options!)
      cacheCss = true;
      desktopNotifications = true;
      proxyUri = "socks5://localhost:1080";
      startMaximized = true;
      sysTray = true;

      extraSettings = {
      };

      keybinds = {
      };
    };
  };
}
