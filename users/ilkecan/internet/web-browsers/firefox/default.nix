{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    versions
  ;

  cfg = config.programs.firefox;
in
{
  imports = [
    ./policies.nix
    ./profiles
  ];

  home.packages = with pkgs; [
    nur.repos.vladexa.mozlz4  # https://github.com/jusw85/mozlz4
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {
      pipewireSupport = true;
    }) {};

    betterfox = {
      enable = true;
      # version = versions.majorMinor cfg.package.version;
      version = "146.0";
    };

    languagePacks = [
      "en-US"
    ];
  };
}
