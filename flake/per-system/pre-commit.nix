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
    pre-commit.settings.package = pkgs.unstable.prek;
    pre-commit.settings.hooks = {
      deadnix.enable = true;

      flint = {
        enable = true;
        name = "flint";
        description = "Check flake dependencies";
        entry = "${getExe pkgs.notashelf.flint} --fail-if-multiple-versions";
        files = "^flake\.(nix|lock)$";
        pass_filenames = false;
      };
    };
  };
}
