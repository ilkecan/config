{
  lib,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in
{
  # https://gitlab.com/rycee/nur-expressions/-/raw/master/pkgs/firefox-addons/addons.json

  imports = importsFromDirectory ./.;

  programs.firefox.profiles.ilkecan.extensions = {
    force = true;
    exhaustivePermissions = true;
    exactPermissions = true;
  };
}
