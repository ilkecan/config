{
  pkgs,
  ...
}:

{
  imports = [
    ./secure-shell.nix
  ];

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
    network-manager-applet.enable = true;
  };
}
