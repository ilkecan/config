{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkIf
  ;
in
{
  programs.dank-material-shell.plugins.commandRunner = {
    enable = true;
    settings = {
      terminal = mkIf config.programs.alacritty.enable "alacritty";
    };
  };
}
