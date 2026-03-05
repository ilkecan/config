{
  userConfig,
  ...
}:

{
  programs.nixos-cli = {
    # https://github.com/nix-community/nixos-cli
    enable = true;
    settings = {
      config_location = userConfig.programs.nh.flake;
      use_nvd = true;

      apply = {
        use_nom = true;
      };
    };
  };
}
