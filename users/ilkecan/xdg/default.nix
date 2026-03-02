{
  pkgs,
  ...
}:

{
  imports = [
    ./autostart.nix
    ./basedir.nix
    ./desktop-entry.nix
    ./desktop-portal.nix
    ./mime-apps.nix
    ./shared-mime-info.nix
    ./terminal-intent.nix
    ./user-dirs.nix
  ];

  home.packages = with pkgs; [
    xdg-utils
  ];

  xdg = {
    enable = true;
  };
}
