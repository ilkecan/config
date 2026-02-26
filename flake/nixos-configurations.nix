{
  self,
  withSystem,
  ...
}:

let
  mkNixosConfiguration =
    {
      system,
      root,
      homeConfig ? null,
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
        inputs'.nixpkgs.lib.nixosSystem {
          modules = [
            inputs'.nixpkgs.nixosModules.readOnlyPkgs
            { nixpkgs.pkgs = pkgs; }

            inputs'.disko.nixosModules.disko
            inputs'.impermanence.nixosModules.impermanence
            inputs'.nix-gaming.nixosModules.pipewireLowLatency
            inputs'.nix-gaming.nixosModules.platformOptimizations
            inputs'.nix-gaming.nixosModules.wine
            inputs'.sops-nix.nixosModules.sops

            root
          ];

          specialArgs = {
            inherit inputs' lib self' homeConfig;
          };
        };
    in
    withSystem system module;
in
{
  flake.nixosConfigurations = {
    mephistopheles = mkNixosConfiguration { system = "x86_64-linux"; root = "${self}/hosts/mephistopheles"; homeConfig = self.homeConfigurations.ilkecan.config; };
  };
}
