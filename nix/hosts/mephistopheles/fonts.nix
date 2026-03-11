{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.inconsolata-go
      noto-fonts
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
        monospace = [ "Inconsolata Go Nerd Font Mono" "Noto Sans Mono" "Noto Sans Math" ];
        sansSerif = [ "Inconsolata Go Nerd Font" "Noto Sans" "Noto Sans Math" ];
        serif = [ "Inconsolata Go Nerd Font" "Noto Serif" "Noto Sans Math" ];
      };
    };
  };
}
