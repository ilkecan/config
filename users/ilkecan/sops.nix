{
  config,
  self',
  ...
}:

{
  sops = {
    defaultSopsFile = "${self'}/secrets/users/${config.home.username}.yaml";

    secrets = {
    };

    templates = {
    };
  };
}
