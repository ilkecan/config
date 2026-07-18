{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  imports = importsFromDirectory ./.;

  home.packages = with pkgs; [
    devenv
    prek # https://github.com/j178/prek
    yaak
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
