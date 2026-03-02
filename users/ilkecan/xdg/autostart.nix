{
  ...
}:

{
  # https://wiki.archlinux.org/title/XDG_Autostart
  xdg.autostart = {
    enable = true;
    entries = [
    ];
    readOnly = !true; # stylix doesn't use `entries` as of `release-25.11`, which result in a failure when `readOnly` is enabled
  };
}
