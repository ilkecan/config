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
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.nixpkgs.nixosModules.readOnlyPkgs
        { nixpkgs.pkgs = pkgs; }

        inputs.disko.nixosModules.disko
        inputs.impermanence.nixosModules.impermanence
        inputs.nix-gaming.nixosModules.pipewireLowLatency
        inputs.nix-gaming.nixosModules.platformOptimizations
        inputs.nix-gaming.nixosModules.wine
        inputs.sops-nix.nixosModules.sops

        ../../hosts/mephistopheles/configuration.nix
      ];

      specialArgs = {
        inherit inputs lib;
        homeConfig = self.homeConfigurations.ilkecan.config;
      };
    };
in

{
  flake = {
    nixosConfigurations = {
      mephistopheles = withSystem "x86_64-linux" module;
    };
  };
}
