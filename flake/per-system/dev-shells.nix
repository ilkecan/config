{
  ...
}:

{
  perSystem = { config, pkgs, ... }: {
    devShells = {
      default = config.devShells.preCommit;
      preCommit = config.pre-commit.devShell;
    };
  };
}
