{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;

  inherit (config.xdg)
    configHome
    ;
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

    configPath = "${configHome}/mozilla/firefox";

    betterfox = {
      enable = true;
    };

    languagePacks = [
      "en-US"
    ];
  };
}
