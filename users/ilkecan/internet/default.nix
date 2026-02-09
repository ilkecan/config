{
  pkgs,
  ...
}:

{
  imports = [
    ./communication
    ./download.nix
    ./instant-messaging
    ./web-browsers
  ];

  home.packages = with pkgs; [
    bandwhich   # https://github.com/imsnif/bandwhich
  ];
}
