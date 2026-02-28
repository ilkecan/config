{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    deadnix # https://github.com/astro/deadnix
    nixf-diagnose # https://github.com/inclyc/nixf-diagnose
    nixfmt # https://github.com/NixOS/nixfmt
  ];
}
