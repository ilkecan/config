# https://github.com/bydlw98/blink-cmp-env
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.env = {
    };

    sourcePlugins.env = {
      enable = true;
      package = pkgs.vimPlugins.blink-cmp-env;
      module = "blink-cmp-env";
    };
  };
}
