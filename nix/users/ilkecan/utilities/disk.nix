{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
      gdu   # https://github.com/dundee/gdu
  ];
}
