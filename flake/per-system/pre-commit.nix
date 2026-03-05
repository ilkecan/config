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
    pre-commit.settings = {
      package = pkgs.unstable.prek;
      hooks = {
        deadnix.enable = true;

        flake-checker.enable = true;

        flint = {
          enable = true;
          name = "flint";
          description = "Check flake dependencies";
          entry = "${getExe pkgs.notashelf.flint} --fail-if-multiple-versions";
          files = "^flake\.(nix|lock)$";
          pass_filenames = false;
        };

        nil.enable = true;
        nixf-diagnose.enable = true;
      };
    };
  };
}
