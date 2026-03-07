{
  lib,
  ...
}:

let
  inherit (lib)
    getExe
  ;

  mkApp = pkg:
    {
      type = "app";
      program = getExe pkg;
      inherit (pkg) meta;
    };
in
{
  perSystem = { self', pkgs, ... }: {
    apps = {
      default = self'.apps.nix-fast-build;
      nix-fast-build = mkApp pkgs.unstable.nix-fast-build;
    };
  };
}
