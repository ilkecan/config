# https://github.com/alexandre-abrioux/blink-cmp-npm.nvim
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.npm = {
      opts = {
        only_latest_version = true;
      };
    };

    sourcePlugins.npm = {
      enable = true;
      package = pkgs.vimPlugins.blink-cmp-npm-nvim;
      module = "blink-cmp-npm";
    };
  };
}
