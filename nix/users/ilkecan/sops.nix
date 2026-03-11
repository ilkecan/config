{
  config,
  self',
  ...
}:

let
  inherit (config.home)
    homeDirectory
    username
    ;
  cfg = config.sops;
in
{
  sops = {
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = "${self'}/secrets/users/${username}.yaml";

    secrets = {
      cachix-auth-token = { };
      github-access-token = { };
    };

    templates = {
      github-mpc-server-env = {
        content = ''
          GITHUB_PERSONAL_ACCESS_TOKEN=${cfg.placeholder.github-access-token}
        '';
      };
    };
  };
}
