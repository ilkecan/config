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

  home = {
    sessionVariables = {
      MANPAGER = "nvim +Man!";
      PAGER = "page";
    };

    packages = with pkgs; [
      _7zz
      inxi
      just
      libnotify # `notify-send`
      lz4
      page
      watchexec
    ];
  };

  programs.alacritty = {
    enable = true;
    theme = "solarized_dark";
    settings = {
      keyboard.bindings = [
        {
          key = "Return";
          mods = "Shift";
          chars = "\n";
        }
      ];
    };
  };
}
