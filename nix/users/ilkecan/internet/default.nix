{
  pkgs,
  ...
}:

{
  imports = [
    ./communication
    ./download.nix
    ./instant-messaging
    ./web
  ];

  home.packages = with pkgs; [
    bandwhich   # https://github.com/imsnif/bandwhich
  ];
}
