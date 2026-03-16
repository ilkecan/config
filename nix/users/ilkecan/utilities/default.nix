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
