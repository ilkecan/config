{
  inputs,
  self,
  withSystem,
  ...
}:

let
  mkNixosConfiguration = system: modulesPath: userConfig:
    let
      module =
        {
          inputs',
          lib,
          pkgs,
          self',
          ...
        }:
        inputs.nixpkgs.lib.nixosSystem {
          modules = [
            inputs.nixpkgs.nixosModules.readOnlyPkgs
            { nixpkgs.pkgs = pkgs; }

            inputs.disko.nixosModules.disko
            inputs.impermanence.nixosModules.impermanence
            inputs.nix-gaming.nixosModules.pipewireLowLatency
            inputs.nix-gaming.nixosModules.platformOptimizations
            inputs.nix-gaming.nixosModules.wine
            inputs.nixos-cli.nixosModules.nixos-cli
            inputs.sops-nix.nixosModules.sops

            self.nixosModules.default

            modulesPath
          ];

          specialArgs = {
            inherit inputs' lib self' userConfig;
          };
        };
    in
    withSystem system module;
in
{
  flake.nixosConfigurations = {
    mephistopheles = mkNixosConfiguration "x86_64-linux" "${self}/hosts/mephistopheles" self.homeConfigurations.ilkecan.config;
  };
}
