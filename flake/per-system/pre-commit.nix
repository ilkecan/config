{
  ...
}:

{
  perSystem = { pkgs, ... }: {
    pre-commit.settings = {
      package = pkgs.unstable.prek;
      hooks = {
        deadnix.enable = true;
        flake-checker.enable = true;
        flint.enable = true;
        gitleaks.enable = true;
        nil.enable = true;
        nixf-diagnose.enable = true;
      };
    };
  };
}
