# https://github.com/saghen/blink.indent
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim.extraPlugins = {
    blink-indent = {
      package = pkgs.vimPlugins.blink-indent;
      setup = ''
        require('blink.indent').setup({
          static = {
            char = "┊",
          },
        })
      '';
    };
  };
}
