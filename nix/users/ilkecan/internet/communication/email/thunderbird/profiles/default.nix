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

  programs.thunderbird.profiles.ilkecan.isDefault = true;
}
