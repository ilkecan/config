{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.inconsolata-go
      noto-fonts-color-emoji
      orbitron
    ];

    fontDir.enable = true;

    fontconfig = {
      enable = true;
      cache32Bit = true;
      useEmbeddedBitmaps = true;

      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "Inconsolata Go Nerd Font Mono" ];
        sansSerif = [ "Inconsolata Go Nerd Font" ];
        serif = [ "Inconsolata Go Nerd Font" ];
      };
    };
  };
}
