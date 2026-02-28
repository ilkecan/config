{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    keep-sorted # https://github.com/google/keep-sorted
    nixfmt # https://github.com/NixOS/nixfmt
    treefmt # https://github.com/numtide/treefmt
  ];
}
