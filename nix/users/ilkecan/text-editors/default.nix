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

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "neovide";
  };
}
