# https://github.com/moyiz/blink-emoji.nvim
{
  ...
}:

{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.emoji = {
    };

    sourcePlugins.emoji = {
      enable = true;
    };
  };
}
