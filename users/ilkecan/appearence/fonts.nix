{
  pkgs,
  ...
}:

{
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";
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
