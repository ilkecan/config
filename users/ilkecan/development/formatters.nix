{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    deadnix # https://github.com/astro/deadnix
    keep-sorted # https://github.com/google/keep-sorted
    nixfmt # https://github.com/NixOS/nixfmt
    treefmt # https://github.com/numtide/treefmt
  ];
}
