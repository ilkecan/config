{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;
in

{
  imports = collectImports ./.;

  programs.nvf.settings.vim = {
    treesitter = {
      enable = true; # https://github.com/nvim-treesitter/nvim-treesitter
      fold = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
  };
}
