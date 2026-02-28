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
    yaak
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    prek.enable = true; # https://github.com/j178/prek
  };
}
