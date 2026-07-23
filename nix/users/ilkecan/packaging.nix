{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    asar # https://github.com/electron/asar
    cntr # https://github.com/Mic92/cntr, used by `pkgs.breakpointHook`
    dpkg # for `dpkg-deb`
    icoutils # for `icotool`
  ];
}
