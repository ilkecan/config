{
  pkgs,
  ...
}:

{
  imports = [
    ./audio
    ./gstreamer.nix
    ./image.nix
    ./video.nix
    ./wireplumber
  ];

  home.packages = with pkgs; [
    exiftool
  ];

  services = {
    playerctld.enable = true;
  };
}
