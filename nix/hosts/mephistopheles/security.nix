{
  lib,
  ...
}:

let
  inherit (lib)
    mkForce
  ;
in
{
  security = {
    pam.services = {
      login.rules.auth = {
        fprintd.control = mkForce "required";
        unix.control = mkForce "required";
        deny.enable = false;
      };

      sudo.fprintAuth = false;
    };

    rtkit.enable = true;  # allows Pipewire to use the realtime scheduler for increased performance

    sudo-rs = {
      # https://github.com/trifectatechfoundation/sudo-rs
      enable = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults !lecture
        Defaults timestamp_timeout=0
      '';
    };
  };
}
