{
  pkgs,
  ...
}:

{
  imports = [
    ./debugging.nix
    ./static-program-analysis
    ./version-control
  ];

  home.packages = with pkgs; [
    unstable.devenv
    unstable.prek # https://github.com/j178/prek # TODO: switch to stable after v26.05
    yaak
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
