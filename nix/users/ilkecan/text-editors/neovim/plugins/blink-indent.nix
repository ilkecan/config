# https://github.com/saghen/blink.indent
{
  ...
}:

{
  programs.nvf.settings.vim.visuals.blink-indent = {
    enable = true;
    setupOpts = {
      static = {
        char = "┊";
      };
    };
  };
}
