{
  lib,
  ...
}:

let
  inherit (lib.my)
    importTree
    ;

  inherit (lib)
    getExe
    removeSuffix
    ;

  mkApp = drv: {
    type = "app";
    program = getExe drv;
    inherit (drv) meta;
  };
in
{
  perSystem =
    { config, pkgs, ... }:
    {
      apps =
        importTree {
          root = ./apps;
          depth = 1;
          importFn = x: mkApp (import x { inherit pkgs; });
          normalizeNameFn = removeSuffix ".nix";
        }
        // {
          default = config.apps.ci;
        };
    };
}
