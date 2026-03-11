{
  lib,
  ...
}:

let
  inherit (lib.my-pkgs)
    callExpression
    ;

  inherit (lib.my)
    importTree
    ;
in
{
  services.easyeffects = {
    # https://github.com/wwmm/easyeffects
    enable = true;

    # https://github.com/wwmm/easyeffects/wiki/Community-Presets
    extraPresets = importTree {
      root = ./presets;
      importFn = callExpression;
      depth = 1;
    };
  };
}
