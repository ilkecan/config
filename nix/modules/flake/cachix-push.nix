{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    concatStringsSep
    filter
    getExe
    mapAttrsToList
    mkIf
    mkOption
    types
    ;

  mkApp = drv: {
    type = "app";
    program = getExe drv;
    inherit (drv) meta;
  };

  mkCachixPush =
    cache: objects:
    let
      pureObjects = filter (x: !x ? __impure) objects;
      paths = map toString pureObjects;
    in
    "cachix push ${cache} ${concatStringsSep " " paths}";

  cfg = config.flake.cachix;
in
{
  options = {
    flake.cachix = {
      push = mkOption {
        type = with types; attrsOf (listOf pathInStore);
        default = { };
        description = "Attrset mapping Cachix cache names to lists of derivations to push.";
      };
    };
  };

  config = {
    perSystem =
      { pkgs, ... }:
      {
        apps = mkIf (cfg.push != { }) {
          cachix-push = mkApp (
            pkgs.writeShellApplication {
              name = "cachix-push";
              runtimeInputs = [ pkgs.cachix ];
              text = concatStringsSep "\n" (mapAttrsToList mkCachixPush cfg.push);
            }
          );
        };
      };
  };
}
