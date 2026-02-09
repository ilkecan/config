{
  homeConfig,
  pkgs,
  ...
}:

let
  notifySend = "${pkgs.libnotify}/bin/notify-send";
in
{
  environment.systemPackages = with pkgs; [
    gamescope-wsi # HDR won't work without this
  ];

  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override {
        # https://github.com/Supreeeme/xwayland-satellite/issues/150#issuecomment-2847677630
        extraArgs = "-system-composer";
      };

      platformOptimizations = {
        # https://github.com/fufexan/nix-gaming#platform-optimizations
        enable = true;
      };

      protontricks.enable = true;   # https://github.com/Matoking/protontricks

      gamescopeSession = {
        # https://github.com/Plagman/gamescope
        enable = true;
        env = {
        };
        args = [
        ];
        steamArgs = [
        ];
      };
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 20;
        };

        custom = {
          start = "${notifySend} 'GameMode started'";
          end = "${notifySend} 'GameMode ended'";
        };
      };
    };

    wine = {
      # https://github.com/fufexan/nix-gaming/blob/master/modules/wine.nix
      enable = true;
      binfmt = true;
      ntsync = true;
    };
  };

  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  users.groups.gamemode.members = [ homeConfig.home.username ];
}
