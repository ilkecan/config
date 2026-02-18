{
  config,
  inputs,
  pkgs,
  ...
}:

let
  inherit (config.home)
    homeDirectory
  ;
in
{
  nix.channels = {
    inherit (inputs)
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
    dix   # https://github.com/faukah/dix
    nix-alien   # https://github.com/thiagokokada/nix-alien
    nix-diff  # https://github.com/Gabriella439/nix-diff
    nix-du  # https://github.com/symphorien/nix-du
    nix-eval-jobs   # https://github.com/nix-community/nix-eval-jobs
    nix-fast-build  # https://github.com/Mic92/nix-fast-build
    nix-melt  # https://github.com/nix-community/nix-melt
    nix-output-monitor  # https://github.com/maralorn/nix-output-monitor
    nix-tree  # https://github.com/utdemir/nix-tree
    nix-update  # https://github.com/Mic92/nix-update/
    nixfmt  # https://github.com/NixOS/nixfmt
    nixos-anywhere  # https://github.com/nix-community/nixos-anywhere
    nixos-facter  # https://github.com/nix-community/nixos-facter
    notashelf.flint   # https://github.com/NotAShelf/flint
    unstable.nixpkgs-review  # https://github.com/Mic92/nixpkgs-review
    vulnix  # https://github.com/nix-community/vulnix
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
