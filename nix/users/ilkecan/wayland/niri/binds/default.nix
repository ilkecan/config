{
  ...
}:

{
  imports = [
    ./defaults.nix
  ];

  programs.niri.settings.binds = {
    "Ctrl+WheelScrollLeft".action.focus-monitor-left = [];
    "Ctrl+WheelScrollRight".action.focus-monitor-right = [];
    "Mod+Return" = {
      hotkey-overlay.title = "Open a Terminal: alacritty";
      action.spawn = "alacritty";
    };
  };
}
