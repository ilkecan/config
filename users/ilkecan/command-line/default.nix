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
      inxi
      just
      libnotify   # `notify-send`
      page
      upterm  # https://github.com/owenthereal/upterm
      watchexec
      ydotool
    ];
  };

  programs.alacritty = {
    enable = true;
    theme = "solarized_dark";
    settings = {
    };
  };
}
