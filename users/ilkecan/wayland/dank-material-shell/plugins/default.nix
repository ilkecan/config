{
  ...
}:

{
  imports = [
    ./command-runner.nix
    ./dank-battery-alerts.nix
    ./dank-kde-connect.nix
    ./dank-pomodoro-timer.nix
    ./developer-utilities.nix
    ./docker-manager.nix
    ./emoji-launcher.nix
  ];

  programs.dank-material-shell = {
    managePluginSettings = true;
  };
}
