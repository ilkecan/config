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
  imports = importsFromDirectory ./.;

  programs.firefox.profiles.ilkecan = {
    id = 0;
    isDefault = true;
  };
}
