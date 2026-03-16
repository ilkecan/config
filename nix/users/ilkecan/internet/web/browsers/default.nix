{
  lib,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  home = {
    sessionVariables = {
      BROWSER = "firefox";
    };
  };
}
