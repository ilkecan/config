{
  ...
}:

{
  perSystem =
    { pkgs, ... }:
    {
      pre-commit.settings = {
        package = pkgs.unstable.prek;
        hooks = {
          comrak.enable = true;
          deadnix.enable = true;
          flake-checker.enable = true;
          flint.enable = true;
          gitleaks.enable = true;
          nil.enable = true;
          nixf-diagnose.enable = true;
          nixfmt.enable = true;
          pre-commit-hook-ensure-sops.enable = true;
          ripsecrets.enable = true;
        };
      };
    };
}
