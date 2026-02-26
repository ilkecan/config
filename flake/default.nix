{
  inputs,
  ...
}:

{
  imports = [
    inputs.flake-parts.flakeModules.modules

    ./modules/flake/per-system-flake-inputs.nix

    ./modules
  ];
}
