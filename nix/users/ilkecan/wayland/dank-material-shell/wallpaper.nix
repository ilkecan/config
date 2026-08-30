{
  lib',
  pkgs,
  ...
}:

let
  inherit (lib'.ilkecan)
    writeNushellScript
    ;

  fractalWallpaper = writeNushellScript "fractal-wallpaper.nu" ''
    let wallpaper = ($env.XDG_STATE_HOME | path join fractalart wallpaper.bmp)
    mkdir ($wallpaper | path dirname)

    ^FractalArt --width 1920 --height 1080 --file $wallpaper --no-bg

    let temperature = try {
      (^dms ipc call night getCurrentTemp | complete | get stdout | str trim | into int)
    }

    if ($temperature != null and $temperature < 6500) {
      # https://github.com/TomSmeets/FractalArt/issues/4#issuecomment-869073994
      ^mogrify -brightness-contrast -40x-10 $wallpaper
    }

    ^dms ipc call wallpaper clear
    ^dms ipc call wallpaper set $wallpaper
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
