{
  config,
  pkgs,
  ...
}:

let
  cfg = config.home;
in

{
  imports = [
    ./appearence
    ./command-line
    ./development
    ./file-managers
    ./flatpak.nix
    ./gaming
    ./gtk.nix
    ./hardware.nix
    ./home-manager.nix
    ./input
    ./internet
    ./multimedia
    ./networking.nix
    ./nix.nix
    ./office.nix
    ./qt.nix
    ./security
    ./sops.nix
    ./text-editors
    ./utilities
    ./wayland
    ./xdg.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ilkecan";
  home.homeDirectory = "/home/${cfg.username}";

  home.packages = with pkgs; [
    patched.overskride
    pwvucontrol
    wasistlos
    telegram-desktop
    ruffle  # https://github.com/ruffle-rs/ruffle

    bottom
    patched.oscar   # https://www.sleepfiles.com/OSCAR/
    brightnessctl
    fd
    file
    glow # https://github.com/charmbracelet/glow
    jq
    magic-wormhole
    microfetch
    fastfetch
    ncdu
    page
    patchelf
    python3
    ripgrep
    scrcpy
    sd
    trash-cli
    tree
    xq-xml
  ];

  programs = {
    tealdeer = {
      enable = true;
      settings = {
        updates = {
          auto_update = true;
        };
      };
    };

    yazi = {
      enable = true;
    };
  };

  systemd.user = {
    enable = true;
    services = {
      # niri-flake-polkit = {
      #   description = "PolicyKit Authentication Agent provided by niri-flake";
      #   wantedBy = [ "niri.service" ];
      #   after = [ "graphical-session.target" ];
      #   partOf = [ "graphical-session.target" ];
      #   serviceConfig = {
      #     Type = "simple";
      #     ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
      #     Restart = "on-failure";
      #     RestartSec = 1;
      #     TimeoutStopSec = 10;
      #   };
      # };
    };
  };

  services.udiskie.enable = true;

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;  # TODO get rid of this
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
