{
  inputs,
  ...
}:

{
  imports = [
    inputs.flake-parts.flakeModules.modules

    ../modules/flake/per-system-flake-inputs.nix # dogfood

    ./args
    ./home-configurations.nix
    ./modules.nix
    ./nixos-configurations.nix
  ];

  debug = true;

  systems = [
    "x86_64-linux"
  ];
}
