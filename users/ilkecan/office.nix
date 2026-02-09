{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US-large
    hunspellDicts.tr_TR
  ];

  programs = {
    zathura = {
      enable = true;
      package = pkgs.unstable.zathura;

      mappings = {
        "<S-Space>" = "scroll half-up";   # Shift modifier does not work on Wayland for some reason
        "<Space>" = "scroll half-down";
      };

      options = {
        # statusbar & vertical scrollbar
        guioptions = "sv";
        # defaults to the system font
        font = "x 16";
        selection-clipboard =	"clipboard";
        window-title-home-tilde = true;
        statusbar-home-tilde = true;
      };
    };
  };
}
