{
  pkgs,
  ...
}:

{
  imports = [
    ./audio.nix
    ./gstreamer.nix
    ./image.nix
    ./video.nix
  ];

  home.packages = with pkgs; [
    exiftool
  ];

  services = {
    playerctld.enable = true;
  };
}
