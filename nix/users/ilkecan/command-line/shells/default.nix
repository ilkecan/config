{
  config,
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

  home.defaultShell = config.programs.zsh.package;
}
