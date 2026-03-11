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
        gitleaks = {
          name = "gitleaks";
          description = "Detect hardcoded secrets using Gitleaks";
          package = pkgs.gitleaks;
          entry = "${getExe config.pre-commit.settings.hooks.gitleaks.package} git --pre-commit --redact --staged --verbose";
          pass_filenames = false;
        };
      };
    };
}
