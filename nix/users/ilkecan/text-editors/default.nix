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

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "neovide";
  };
}
