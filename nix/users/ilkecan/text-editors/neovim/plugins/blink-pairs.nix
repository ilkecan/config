# https://github.com/saghen/blink.pairs
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim.extraPlugins = {
    blink-pairs = {
      package = pkgs.vimPlugins.blink-pairs;
      setup = ''
        require('blink.pairs').setup({
        })
      '';
    };
  };
}
