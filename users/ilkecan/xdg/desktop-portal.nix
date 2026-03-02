{
  pkgs,
  ...
}:

{
  # https://wiki.archlinux.org/title/XDG_Desktop_Portal
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gnome # for screencasting
      xdg-desktop-portal-gtk
    ];
  };
}
