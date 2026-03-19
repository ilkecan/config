{
  lib,
  ...
}:

let
  inherit (lib)
    mkForce
    ;

  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  programs.niri.settings.binds = {
    "Ctrl+WheelScrollLeft".action.focus-monitor-left = [ ];
    "Ctrl+WheelScrollRight".action.focus-monitor-right = [ ];
    "Mod+Return" = {
      hotkey-overlay.title = "Open a Terminal: alacritty";
      action.spawn = "alacritty";
    };

    "Print".action = mkForce {
      spawn = [
        "dms"
        "ipc"
        "call"
        "niri"
        "screenshot"
      ];
    };
    "Ctrl+Print".action = mkForce {
      spawn = [
        "dms"
        "ipc"
        "call"
        "niri"
        "screenshotScreen"
      ];
    };
    "Alt+Print".action = mkForce {
      spawn = [
        "dms"
        "ipc"
        "call"
        "niri"
        "screenshotWindow"
      ];
    };
  };
}
