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

  programs.firefox.profiles.ilkecan = {
    id = 0;
    isDefault = true;
  };
}
