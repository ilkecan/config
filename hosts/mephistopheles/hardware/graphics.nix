{
  ...
}:

{
  boot.kernelParams = [
    "i915.enable_guc=3"   # https://wiki.archlinux.org/title/Intel_graphics#Enable_GuC_/_HuC_firmware_loading
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    intel-gpu-tools.enable = true;  # for `intel_gpu_top`
  };
}
