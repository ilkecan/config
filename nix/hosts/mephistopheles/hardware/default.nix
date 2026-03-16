{
  config,
  lib,
  userConfig,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  # TODO switch to facter after NixOS 26.05
  # hardware.facter.reportPath = ./facter.json;

  hardware = {
    i2c.enable = true; # https://danklinux.com/docs/dankmaterialshell/cli-doctor#i2cddc
  };

  services = {
    fwupd.enable = true;
    power-profiles-daemon.enable = true; # https://danklinux.com/docs/dankmaterialshell/cli-doctor#power-profiles-daemon
  };

  users.groups.${config.hardware.i2c.group}.members = [ userConfig.home.username ];
}
