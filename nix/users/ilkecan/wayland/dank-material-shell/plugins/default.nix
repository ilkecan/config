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

  programs.dank-material-shell = {
    managePluginSettings = true;
  };
}
