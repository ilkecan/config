{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    cheese
    libcamera-qcam # `qcam`,  `libcamerify`
  ];
}
