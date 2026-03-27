{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.my)
    collectImports
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

    betterfox = {
      enable = true;
    };

    languagePacks = [
      "en-US"
    ];
  };
}
