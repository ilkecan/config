{
  pkgs,
  ...
}:

{
  imports = [
    ./nix.nix
  ];

  home.packages = with pkgs; [
    keep-sorted # https://github.com/google/keep-sorted
    treefmt # https://github.com/numtide/treefmt
  ];
}
