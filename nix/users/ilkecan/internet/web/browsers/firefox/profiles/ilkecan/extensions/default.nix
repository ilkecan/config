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
  # https://gitlab.com/rycee/nur-expressions/-/raw/master/pkgs/firefox-addons/addons.json

  imports = collectImports ./.;

  programs.firefox.profiles.ilkecan.extensions = {
    force = true;
    exhaustivePermissions = true;
    exactPermissions = true;
  };
}
