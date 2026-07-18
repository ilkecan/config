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

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Prefer the modern iHD backend
  };

  home.packages = with pkgs; [
    dfu-util
    hw-probe
    hwinfo
    libva-utils
    mesa-demos # for `eglinfo`
    pciutils
    usbutils # for `lsusb`
    vulkan-tools
  ];
}
