{
  inputs,
  self,
  withSystem,
  ...
}:

let
  module =
    {
      lib,
      pkgs,
      ...
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit lib pkgs;

      modules = [
        inputs.betterfox-nix.homeModules.betterfox
        inputs.dms-plugin-registry.modules.default
        inputs.dms.homeModules.dank-material-shell
        inputs.dms.homeModules.niri
        inputs.niri-flake.homeModules.niri
        inputs.niri-flake.homeModules.stylix
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.nix-index-database.homeModules.default
        inputs.nixcord.homeModules.nixcord
        inputs.nvf.homeManagerModules.default
        inputs.sops-nix.homeManagerModules.sops
        inputs.stylix.homeModules.stylix

        ../../users/ilkecan/home.nix
      ];

      extraSpecialArgs = {
        inherit inputs;
        osConfig = self.nixosConfigurations.mephistopheles.config;
      };
    };
in

{
  flake = {
    homeConfigurations = {
      ilkecan = withSystem "x86_64-linux" module;
    };
  };
}
