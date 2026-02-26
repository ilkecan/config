{
  lib,
  pkgs ? null,
  ...
}:

let
  inherit (lib)
    optionalAttrs
  ;
in
lib.extend (
  final: prev: {
    my = import ./my.nix { lib = final; };
  } // optionalAttrs (pkgs != null) {
    my-pkgs = import ./my-pkgs.nix { inherit pkgs; lib = final; };
  }
)
