{
  inputs,
  ...
}:

{
  imports = [
    inputs.flake-parts.flakeModules.modules

    ../modules/flake/per-system-flake-inputs.nix # dogfood

    ./hosts
    ./lib.nix
    ./modules.nix
    ./nixpkgs.nix
    ./users
  ];

  debug = true;

  systems = [
    "x86_64-linux"
  ];
}
