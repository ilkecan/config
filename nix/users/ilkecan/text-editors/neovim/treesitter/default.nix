{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib._.ilkecan)
    importsFromDirectory
    ;
in

{
  imports = importsFromDirectory ./.;

  programs.nvf.settings.vim = {
    treesitter = {
      enable = true; # https://github.com/nvim-treesitter/nvim-treesitter
      fold = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
  };
}
