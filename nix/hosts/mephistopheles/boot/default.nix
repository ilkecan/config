{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

  boot = {
    kernel.sysctl."kernel.sysrq" = 1; # https://wiki.nixos.org/wiki/Linux_kernel#Enable_SysRq
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };
  };

  systemd.enableEmergencyMode = false;
}
