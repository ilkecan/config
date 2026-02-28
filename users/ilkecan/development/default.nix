{
  pkgs,
  ...
}:

{
  imports = [
    ./debugging.nix
    ./formatters.nix
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
  };
}
