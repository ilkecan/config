{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    binutils  # https://www.gnu.org/software/binutils/
    frida-tools   # https://github.com/frida/frida
  ];
}
