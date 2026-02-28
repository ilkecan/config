{
  inputs,
}:

{
  owner = "nix-community";
  repo = "home-manager";
  src = inputs.home-manager;
  name = "home-manager";
  pulls = {
    "8820" = "sha256-lCC7jwmpF5v6qFRpVLA1OrBQOXJuRmPeb8BdEo71f6Q="; # programs.prek: init module
  };
}
