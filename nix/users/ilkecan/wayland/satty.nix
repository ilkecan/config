# https://github.com/Satty-org/Satty
{
  lib,
  config,
  ...
}:

let
  inherit (lib)
    mkIf
  ;
in
{
  home.sessionVariables = mkIf config.programs.dank-material-shell.enable {
    DMS_SCREENSHOT_EDITOR = "satty";
  };

  programs.satty = {
    enable = true;
    # https://github.com/gabm/Satty#configuration-file
    settings = {
    };
  };
}
