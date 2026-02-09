{
  config,
  inputs,
  ...
}:

{
  sops = {
    defaultSopsFile = "${inputs.self}/secrets/users/${config.home.username}.yaml";

    secrets = {
    };

    templates = {
    };
  };
}
