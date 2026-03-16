# https://github.com/NotAShelf/nvf/
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

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        enableLuaLoader = true; # https://github.com/lewis6991/impatient.nvim

        withNodeJs = true;
        withPython3 = true;

        spellcheck = {
          enable = true;
          programmingWordlist.enable = true;
        };
      };
    };
  };
}
