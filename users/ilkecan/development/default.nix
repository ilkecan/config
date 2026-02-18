{
  pkgs,
  ...
}:

{
  imports = [
    ./debugging.nix
    ./version-control
  ];

  home.packages = with pkgs; [
    unstable.devenv
    treefmt
    yaak
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
