{
  inputs,
}:

{
  owner = "nix-community";
  repo = "nixos-cli";
  src = inputs.nixos-cli;
  name = "nixos-cli";
  pulls = {
    "202" = "sha256-0sA3Gm156IaYSnFoKktElFGFLcRZmTJDY9nYa6BkXr8=";
  };
}
