{
  config,
  homeConfig,
  lib,
  ...
}:

let
  inherit (lib)
    optional
  ;

  # https://userbase.kde.org/KDEConnect#I_have_two_devices_running_KDE_Connect_on_the_same_network,_but_they_can't_see_each_other
  kdeConnectPortRange = {
    from = 1714;
    to = 1764;
  };
in

{
  imports = [
    ./secure-shell.nix
    ./synchronization.nix
  ];

  networking = {
    hostName = "mephistopheles";

    nameservers = [
      "127.0.0.1"
    ];

    resolvconf = {
      useLocalResolver = true;
      dnsSingleRequest = true;
    };

    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      dns = "none";
      wifi.backend = "iwd";
    };

    firewall = {
      enable = true;

      allowedTCPPortRanges = [
        kdeConnectPortRange
      ];

      allowedUDPPortRanges = [
        kdeConnectPortRange
      ];
    };
  };

  programs = {
    wavemon.enable = true;
    wireshark.enable = true;
  };

  services = {
    dnscrypt-proxy = {
      enable = true;
      settings = {
        # server_names = [
        #   "cloudflare"
        # ];
        listen_addresses = [ "127.0.0.1:53" ] ++ optional config.networking.enableIPv6 "[::1]:53";
        dnscrypt_servers = false;
        require_dnssec = true;
        http3 = true;   # https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Configuration#http3-support-configuration
        block_ipv6 = true;  # https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Performance#ipv6-blocking

        # monitoring_ui = {
        #   enabled = true;
        #   username = "";
        #   password = "";
        # };
      };
    };
  };

  users.groups.networkmanager.members = [ homeConfig.home.username ];
}
