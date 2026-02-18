{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    frida-tools   # https://github.com/frida/frida
  ];
}
