{
  pkgs,
  ...
}:

pkgs.lib.extend (
  final: prev: {
    my = import ./my.nix { inherit pkgs; lib = final; };
  }
)
