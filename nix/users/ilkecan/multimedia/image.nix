{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    imagemagick
    krita
    libjxl  # `cjxl` & `jxlinfo`
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
