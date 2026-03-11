{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    bucklespring-libinput   # https://github.com/zevv/bucklespring
    xremap  # https://github.com/xremap/xremap, https://github.com/xremap/xremap/blob/master/doc/running_with_sudo.md, https://github.com/xremap/nix-flake
  ];
}
