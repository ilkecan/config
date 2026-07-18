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

  services = {
    playerctld.enable = true;
  };
}
