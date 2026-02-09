{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  inherit (lib)
    id
    mkIf
    mkMerge
  ;

  inherit (builtins)
    any
  ;

  mozEnabled = any id (map (x: config.programs.${x}.enable) ["firefox" "thunderbird"]);
in
{
  imports = [
    ./dank-material-shell.nix
    ./niri
    ./satty.nix
  ];

  dbus.packages = [
    pkgs.nautilus   # required for xdg-desktop-portal-gnome's FileChooser to work properly
  ];

  home = {
    packages = with pkgs; [
      wev
      wl-clipboard-rs
      xeyes
      unstable.xwayland-satellite
    ];

    sessionVariables = mkMerge [
      {
        NIXOS_OZONE_WL = 1;
      }
      (mkIf mozEnabled {
        MOZ_ENABLE_WAYLAND = 1;
        MOZ_USE_XINPUT2 = 1;
      })
      (mkIf config.qt.enable {
        QT_QPA_PLATFORM = "wayland";
      })
      # NOTE: custom keyboard layout doesn't work as of 2026-01-10.
      # (mkIf osConfig.programs.steam.enable {
      #   PROTON_ENABLE_WAYLAND = 1;
      # })
    ];
  };

  programs = {
    alacritty.enable = true;
  };

  services = {
    gnome-keyring.enable = true;

    udiskie = {
      enable = true;
      automount = true;
      notify = true;
    };

    # walker = {
    #   enable = true;
    #   systemd.enable = true;
    #   settings = {
    #     app_launch_prefix = "";
    #     as_window = false;
    #     close_when_open = false;
    #     disable_click_to_close = false;
    #     force_keyboard_focus = false;
    #     hotreload_theme = false;
    #     locale = "";
    #     monitor = "";
    #     terminal_title_flag = "";
    #     theme = "default";
    #     timeout = 0;
    #   };
    # };
  };
}
