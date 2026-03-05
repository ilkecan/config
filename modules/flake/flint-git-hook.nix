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
  perSystem = { pkgs, ... }: {
    pre-commit.settings.hooks = {
      flint = {
        name = "flint";
        description = "Check flake dependencies";
        entry = "${getExe pkgs.notashelf.flint} --fail-if-multiple-versions";
        files = "^flake\.(nix|lock)$";
        pass_filenames = false;
      };
    };
  };
}
