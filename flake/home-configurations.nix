{
  inputs,
  self,
  withSystem,
  ...
}:

let
  mkHomeConfiguration = system: modulesPath: hostConfig:
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
            inputs.mcp-servers-nix.homeManagerModules.default
            inputs.niri-flake.homeModules.niri
            inputs.niri-flake.homeModules.stylix
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
            inputs.nix-index-database.homeModules.default
            inputs.nixcord.homeModules.nixcord
            inputs.nvf.homeManagerModules.default
            inputs.optnix.outputs.homeModules.optnix
            inputs.sops-nix.homeModules.sops
            inputs.stylix.homeModules.stylix

            self.homeModules.default

            modulesPath
          ];

          extraSpecialArgs = {
            inherit inputs' self' hostConfig;
            osConfig = hostConfig; # keep this since it is an established HM convention
          };
        };
    in
    withSystem system module;
in
{
  flake.homeConfigurations = {
    ilkecan = mkHomeConfiguration "x86_64-linux" "${self}/users/ilkecan" self.nixosConfigurations.mephistopheles.config;
  };
}
