{
  ...
}:

{
  programs.nvf.settings.vim = {
    globals = {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;

      mapleader = " ";
      maplocalleader = " ";

      vimsyn_embed = "lpPr"; # https://neovim.io/doc/user/syntax.html#g:vimsyn_embed
    };
  };
}
