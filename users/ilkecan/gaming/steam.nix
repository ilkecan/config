{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    samira # https://github.com/jsnli/Samira
    steam-tui # https://github.com/dmadisetti/steam-tui
    steamcmd  # https://developer.valvesoftware.com/wiki/SteamCMD
  ];
}
