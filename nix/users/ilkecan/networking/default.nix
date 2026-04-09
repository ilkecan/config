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
      PROXYCHAINS_SOCKS5_PORT = 1080;
    };

    packages = with pkgs; [
      byedpi # https://github.com/hufrea/byedpi
      inetutils # for 'telnet'
      ldns # https://github.com/NLnetLabs/ldns, for `drill`
      mtr # https://github.com/traviscross/mtr
      nmap # https://github.com/nmap/nmap
      proxychains-ng # https://github.com/rofl0r/proxychains-ng
      q # https://github.com/natesales/q
      socat # required for `claude-code` sandboxing (`/sandbox`)
    ];
  };

  services = {
    byedpi = {
      enable = true;
      extraArgs = [
        "-Ku"
        "-a5"
        "-An"
        "-Kt"
        "-V443"
        "-o1"
        "-An"
        "-f-1"
        "-t6"
        "-T0.5"
        "-Ars"
        "-d0+sm"
        "-t6"
        "-At"
        "-r1+s"
      ];
    };
    network-manager-applet.enable = true;
  };
}
