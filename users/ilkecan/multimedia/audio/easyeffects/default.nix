{
  config,
  lib,
  self',
  ...
}:

let
  inherit (lib.my)
    callExpression
    importTree
  ;

  user = config.home.username;
  dataRelPath = "easyeffects/autoload";
in
{
  services.easyeffects = {
    # https://github.com/wwmm/easyeffects
    enable = true;

    # https://github.com/wwmm/easyeffects/wiki/Community-Presets
    extraPresets = importTree { root = ./presets; importFn = callExpression; depth = 1; };
  };

  xdg.dataFile.${dataRelPath} = {
    source = "${self'}/users/${user}/dotfiles/.local/share/${dataRelPath}";
    recursive = true;
  };
}
