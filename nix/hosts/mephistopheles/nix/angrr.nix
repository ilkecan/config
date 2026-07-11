{
  ...
}:

{
  services.angrr = {
    # https://github.com/linyinfeng/angrr
    enable = true;
    settings = {
      profile-policies = {
        home-manager = {
          keep-latest-n = 8;
          keep-since = "30d";
          profile-paths = [
            "~/.local/state/nix/profiles/home-manager"
          ];
        };

        system = {
          keep-booted-system = true;
          keep-current-system = true;
          keep-latest-n = 8;
          keep-since = "30d";
          profile-paths = [
            "/nix/var/nix/profiles/system"
          ];
        };

        user = {
          keep-latest-n = 4;
          keep-since = "7d";
          profile-paths = [
            "/nix/var/nix/profiles/per-user/root/profile"
            "~/.local/state/nix/profiles/profile"
          ];
        };
      };

      temporary-root-policies = {
        direnv = {
          path-regex = "/\\.direnv/";
          period = "14d";
        };

        result = {
          path-regex = "/result[^/]*$";
          period = "3d";
        };
      };
    };
  };
}
