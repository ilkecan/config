{
  pkgs,
  ...
}:

let
  fractalWallpaper = pkgs.writeShellScript "fractal-wallpaper" ''
    wallpaper="$XDG_STATE_HOME/fractalart/wallpaper.bmp"
    mkdir -p "$(dirname "$wallpaper")"

    FractalArt --width 1920 --height 1080 --file "$wallpaper" --no-bg

    # TODO: `dms ipc call night status` always return the same string use `dms
    # ipc call night temperature` after
    # https://github.com/AvengeMedia/DankMaterialShell/issues/1778 is resolved
    # if dms ipc call night status 2>/dev/null | grep -q "Night mode is enabled"; then
    #   # https://github.com/TomSmeets/FractalArt/issues/4#issuecomment-869073994
    #   magick "$wallpaper" -brightness-contrast -40x-10 "$wallpaper"
    # fi

    dms ipc call wallpaper clear
    dms ipc call wallpaper set "$wallpaper"
  '';
in
{
  home.packages = with pkgs; [
    haskellPackages.FractalArt
  ];

  systemd.user.services.fractal-wallpaper = {
    Unit = {
      Description = "Generate and set FractalArt wallpaper";
      After = [ "dms.service" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = fractalWallpaper;
    };
  };

  systemd.user.timers.fractal-wallpaper = {
    Unit = {
      Description = "Generate FractalArt wallpaper periodically";
    };

    Timer = {
      OnActiveSec = "0"; # run once on login
      OnUnitActiveSec = "1h"; # then hourly afterwards
    };

    Install = {
      WantedBy = [ "dms.service" ];
    };
  };
}
