{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ddcui
    ddcutil
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ ddcci-driver ];
  boot.kernelModules = [ "ddcci-backlight" ];

  services.udev.extraRules = let
    # https://wiki.nixos.org/wiki/Backlight#Via_ddcci-driver
    bash = "${pkgs.bash}/bin/bash";
    ddcciDev = "AUX USBC3/DDI TC3/PHY TC3";
    ddcciNode = "/sys/bus/i2c/devices/i2c-14/new_device";
  in ''
    SUBSYSTEM=="i2c", ACTION=="add", ATTR{name}=="${ddcciDev}", RUN+="${bash} -c 'sleep 30; printf ddcci\ 0x37 > ${ddcciNode}'"
  '';
}
