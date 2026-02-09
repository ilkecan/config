# https://github.com/MahanRahmati/blink-nerdfont.nvim
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.nerdfont = {
    };

    sourcePlugins.nerdfont = {
      enable = true;
      package = pkgs.vimPlugins.blink-nerdfont-nvim;
      module = "blink-nerdfont";
    };
  };
}
