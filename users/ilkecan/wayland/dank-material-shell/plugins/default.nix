{
  ...
}:

{
  imports = [
    ./dank-battery-alerts.nix
    ./dank-kde-connect.nix
    ./dank-pomodoro-timer.nix
    ./emoji-launcher.nix
  ];

  programs.dank-material-shell = {
    managePluginSettings = true;
  };
}
