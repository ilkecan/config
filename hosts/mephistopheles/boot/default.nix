{
  pkgs,
  ...
}:

{
  imports = [
    ./plymouth.nix
    ./regdomain.nix
    ./zswap.nix
  ];

  boot = {
    initrd.systemd.enable = true;

    kernel.sysctl."kernel.sysrq" = 1;   # https://wiki.nixos.org/wiki/Linux_kernel#Enable_SysRq
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
