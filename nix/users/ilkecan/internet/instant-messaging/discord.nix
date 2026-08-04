{
  ...
}:

{
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    dorion = {
      enable = true;
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
