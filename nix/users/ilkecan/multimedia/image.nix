{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    exiftool
    imagemagick
    krita
    libjxl # `cjxl` & `jxlinfo`
  ];

  programs = {
    feh = {
      enable = true;
      buttons = {
      };
      keybindings = {
      };
    };

    imv = {
      enable = true;
      settings = {
      };
    };
  };
}
