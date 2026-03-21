{
  config,
  lib,
  self',
  ...
}:

let
  inherit (lib)
    mapAttrsToList
    concatStringsSep
    ;

  cfg = config.sops;

  nixAccessTokens = {
    "github.com" = cfg.placeholder.github-access-token;
  };
in
{
  sops = {
    defaultSopsFile = "${self'}/secrets/hosts/${config.networking.hostName}.yaml";

    secrets = {
      github-access-token = { };
      ilkecan-hashed-password = {
        neededForUsers = true;
      };
    };

    templates = {
      nix-access-tokens = {
        content = ''
          access-tokens = ${concatStringsSep " " (mapAttrsToList (n: v: "${n}=${v}") nixAccessTokens)}
        '';
        group = config.users.groups.wheel.name;
        mode = "0440";
      };
    };
  };
}
