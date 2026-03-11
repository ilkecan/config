{
  lib,
  ...
}:

let
  inherit (lib) getExe;

  mkApp = drv: {
    type = "app";
    program = getExe drv;
    inherit (drv) meta;
  };
in
{
  perSystem = { self', pkgs, ... }: {
    apps = {
      ci = mkApp (import ./ci.nix { inherit pkgs; });
      default = self'.apps.ci;
    };
  };
}
