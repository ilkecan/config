{
  inputs,
  ...
}:

{
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    inputs.flake-parts.flakeModules.modules
    inputs.home-manager.flakeModules.default

    ../modules/flake # dogfood

    ./args
    ./flake-modules.nix
    ./home-configurations.nix
    ./home-modules.nix
    ./modules.nix
    ./nixos-configurations.nix
    ./nixos-modules.nix
  ];

  debug = true;

  systems = [
    "x86_64-linux"
  ];
}
