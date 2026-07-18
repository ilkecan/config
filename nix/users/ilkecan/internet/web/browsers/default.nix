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

  home = {
    sessionVariables = {
      BROWSER = "firefox";
    };
  };
}
