{
  pkgs,
  ...
}:

{
  imports = [
    ./steam.nix
  ];

  home.packages = with pkgs; [
    goverlay  # github.com/benjamimgois/goverlay
    hyperion-ng
    itch
    moonlight-qt
    protonplus  # https://github.com/Vysp3r/ProtonPlus
  ];

  programs = {
    mangohud = {
      # https://github.com/flightlessmango/MangoHud
      enable = true;
      enableSessionWide = true;
      settings = {
      };
      settingsPerApplication = {
      };
    };
  };
}
