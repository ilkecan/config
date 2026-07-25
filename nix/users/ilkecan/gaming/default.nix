{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

  home.packages = with pkgs; [
    goverlay # github.com/benjamimgois/goverlay
    hyperion-ng # https://github.com/hyperion-project/hyperion.ng
    itch # https://github.com/itchio/itch
    moonlight-qt # https://github.com/moonlight-stream/moonlight-qt
    nur.repos.ilkecan.pokeclicker-desktop # https://github.com/RedSparr0w/Pokeclicker-desktop
    protonplus # https://github.com/Vysp3r/ProtonPlus
  ];

  programs = {
    mangohud = {
      # https://github.com/flightlessmango/MangoHud
      enable = true;
      enableSessionWide = true;
      settings = {
        no_display = true;
      };
      settingsPerApplication = {
      };
    };
  };
}
