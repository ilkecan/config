{
  lib,
  ...
}:

let
  inherit (lib)
    getExe
    ;
in
{
  perSystem =
    { config, pkgs, ... }:
    {
      pre-commit.settings.hooks = {
        flint = {
          name = "flint";
          description = "Check flake dependencies";
          package = pkgs.notashelf.flint;
          entry = "${getExe config.pre-commit.settings.hooks.flint.package} --fail-if-multiple-versions";
          files = "^flake\.(nix|lock)$";
          pass_filenames = false;
        };
      };
    };
}
