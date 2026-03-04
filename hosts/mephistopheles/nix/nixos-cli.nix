{
  self',
  ...
}:

{
  programs.nixos-cli = {
    # https://github.com/nix-community/nixos-cli
    enable = true;
    settings = {
      config_location = self'; # use the store path instead of a ~ path to always target the active config
      use_nvd = true;

      apply = {
        use_nom = true;
      };
    };
  };
}
