{
  pkgs,
  ...
}:

{
  imports = [
    ./shells
  ];

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
      ydotool
    ];
  };

  programs.alacritty = {
    enable = true;
    theme = "solarized_dark";
    settings = {
      keyboard.bindings = [
        { key = "Return"; mods = "Shift"; chars = "\n"; }
      ];
    };
  };
}
