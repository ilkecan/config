{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    deadnix # https://github.com/astro/deadnix
    flake-checker # https://github.com/DeterminateSystems/flake-checker
    nix-ast-lint # https://codeberg.org/tlater/nix-ast-lint
    nixf-diagnose # https://github.com/inclyc/nixf-diagnose
    nixfmt # https://github.com/NixOS/nixfmt
    nixpkgs-hammering # https://github.com/jtojnar/nixpkgs-hammering
    nixpkgs-lint # https://github.com/nix-community/nixpkgs-lint
    notashelf.flint # https://github.com/NotAShelf/flint
    statix # https://github.com/oppiliappan/statix
    vulnix # https://github.com/nix-community/vulnix
  ];
}
