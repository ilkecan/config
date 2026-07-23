{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    fluffychat # https://github.com/krille-chan/fluffychat
    matrix-commander-rs # https://github.com/8go/matrix-commander-rs
  ];
}
