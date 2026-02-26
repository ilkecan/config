{
  inputs,
  ...
}:

{
  imports = [
    inputs.flake-parts.flakeModules.modules

    ../modules/flake/per-system-flake-inputs.nix # dogfood

    ./home-configurations.nix
    ./lib.nix
    ./modules.nix
    ./nixos-configurations.nix
    ./nixpkgs.nix
  ];

  debug = true;

  systems = [
    "x86_64-linux"
  ];
}
