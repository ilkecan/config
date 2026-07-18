{
  config,
  inputs',
  lib,
  pkgs,
  ...
}:

let
  inherit (config.home)
    homeDirectory
    ;

  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

  nix.channels = {
    inherit (inputs')
      nixpkgs
      nixpkgs-unstable
      ;
  };

  home.sessionVariables = {
    NH_NO_CHECKS = 1;
    NIXPKGS_ALLOW_UNFREE = toString pkgs.config.allowUnfree;
  };

  home.packages = with pkgs; [
    cachix
    dix # https://github.com/faukah/dix
    nix-alien # https://github.com/thiagokokada/nix-alien
    nix-diff # https://github.com/Gabriella439/nix-diff
    nix-du # https://github.com/symphorien/nix-du
    nix-melt # https://github.com/nix-community/nix-melt
    nix-olde # https://github.com/trofi/nix-olde
    nix-output-monitor # https://github.com/maralorn/nix-output-monitor
    nix-tree # https://github.com/utdemir/nix-tree
    nix-update # https://github.com/Mic92/nix-update/
    nixos-anywhere # https://github.com/nix-community/nixos-anywhere
    nixos-facter # https://github.com/nix-community/nixos-facter
    nixos-shell # https://github.com/Mic92/nixos-shell
    nixpkgs-review # https://github.com/Mic92/nixpkgs-review
    unstable.nix-eval-jobs # https://github.com/nix-community/nix-eval-jobs
    unstable.nix-fast-build # https://github.com/Mic92/nix-fast-build
  ];

  programs = {
    nh = {
      enable = true;
      flake = "${homeDirectory}/repos/git/github.com/ilkecan/config";
    };
    nix-index.enable = true;
    nix-index-database.comma.enable = true; # https://github.com/nix-community/comma
  };
}
