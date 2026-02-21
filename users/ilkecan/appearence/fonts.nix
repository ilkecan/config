{
  pkgs,
  ...
}:

{
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";
    defaultFonts = {
      monospace = [ "Noto Sans Mono" "Noto Sans Math" ];
      sansSerif = [ "Noto Sans" "Noto Sans Math" ];
      serif = [ "Noto Serif" "Noto Sans Math" ];
    };
  };

  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.inconsolata-go;
      name = "Inconsolata Go Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.inconsolata-go;
      name = "Inconsolata Go Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.inconsolata-go;
      name = "Inconsolata Go Nerd Font Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
