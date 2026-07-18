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

  programs = {
    atuin = {
      enable = true;
      flags = [
      ];

      daemon = {
        enable = true;
      };

      forceOverwriteSettings = true;
      settings = {
        enter_accept = true;
      };
    };
  };
}
