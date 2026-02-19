{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    asar  # https://github.com/electron/asar
    dpkg  # for `dpkg-deb`
  ];
}
