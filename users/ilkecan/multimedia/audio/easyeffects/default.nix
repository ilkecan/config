{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (builtins)
    readDir
  ;

  inherit (lib)
    attrNames
    genAttrs
  ;

  inherit (lib.my)
    callExpression
    relativeTo
  ;

  user = config.home.username;
  dataRelPath = "easyeffects/autoload";
in
{
  services.easyeffects = {
    # https://github.com/wwmm/easyeffects
    enable = true;

    # https://github.com/wwmm/easyeffects/wiki/Community-Presets
    extraPresets = genAttrs (attrNames (readDir ./presets)) (x: callExpression (relativeTo ./presets x)) ;
  };

  xdg.dataFile.${dataRelPath} = {
    source = "${inputs.self}/users/${user}/dotfiles/.local/share/${dataRelPath}";
    recursive = true;
  };
}
