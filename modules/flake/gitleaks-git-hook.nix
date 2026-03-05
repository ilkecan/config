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
      gitleaks = {
        name = "gitleaks";
        description = "Detect hardcoded secrets using Gitleaks";
        entry = "${getExe pkgs.gitleaks} git --pre-commit --redact --staged --verbose";
        pass_filenames = false;
      };
    };
  };
}
