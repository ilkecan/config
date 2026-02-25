{
  config,
  homeConfig,
  inputs',
  ...
}:

{
  imports = [
    ./battery.nix
    ./configuration.nix
    ./graphics.nix
    ./keyboard.nix
    ./monitor.nix
    ./mouse.nix
    ./printer.nix
    ./thunderbolt.nix
    inputs'.nixos-hardware.nixosModules.lenovo-thinkpad-e14-intel-gen7
  ];

  # TODO switch to facter after NixOS 26.05
  # hardware.facter.reportPath = ./facter.json;

  hardware = {
    i2c.enable = true;  # https://danklinux.com/docs/dankmaterialshell/cli-doctor#i2cddc
  };

  services = {
    fwupd.enable = true;
    power-profiles-daemon.enable = true;  # https://danklinux.com/docs/dankmaterialshell/cli-doctor#power-profiles-daemon
  };

  users.groups.${config.hardware.i2c.group}.members = [ homeConfig.home.username ];
}
