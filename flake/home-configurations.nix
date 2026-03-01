{
  inputs,
  self,
  withSystem,
  ...
}:

let
  mkHomeConfiguration =
    {
      system,
      root,
      osConfig ? null,
    }:
    let
      module =
        {
          inputs',
          lib,
          pkgs,
          self',
          ...
        }:
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit lib pkgs;

          modules = [
            inputs.betterfox-nix.homeModules.betterfox
            inputs.dms-plugin-registry.homeModules.default
            inputs.dms.homeModules.dank-material-shell
            inputs.dms.homeModules.niri
            inputs.niri-flake.homeModules.niri
            inputs.niri-flake.homeModules.stylix
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
            inputs.nix-index-database.homeModules.default
            inputs.nixcord.homeModules.nixcord
            inputs.nvf.homeManagerModules.default
            inputs.sops-nix.homeModules.sops
            inputs.stylix.homeModules.stylix

            self.homeModules.default

            root
          ];

          extraSpecialArgs = {
            inherit inputs' self' osConfig;
          };
        };
    in
    withSystem system module;
in
{
  flake.homeConfigurations = {
    ilkecan = mkHomeConfiguration { system = "x86_64-linux"; root = "${self}/users/ilkecan"; osConfig = self.nixosConfigurations.mephistopheles.config; };
  };
}
