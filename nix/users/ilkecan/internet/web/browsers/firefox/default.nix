{
  config,
  inputs',
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    attrNames
    elem
    elemAt
    length
    versions
    ;

  inherit (lib.my)
    collectImports
    ;

  cfg = config.programs.firefox;
  version = versions.majorMinor cfg.package.version;
  supportedVersions = attrNames (import "${inputs'.betterfox-nix}/data/firefox");
in
{
  imports = collectImports ./.;

  home.packages = with pkgs; [
    nur.repos.vladexa.mozlz4 # https://github.com/jusw85/mozlz4
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {
      pipewireSupport = true;
    }) { };

    betterfox = {
      enable = true;
      version =
        if elem version supportedVersions then
          version
        else
          elemAt supportedVersions (length supportedVersions - 1);
    };

    languagePacks = [
      "en-US"
    ];
  };
}
