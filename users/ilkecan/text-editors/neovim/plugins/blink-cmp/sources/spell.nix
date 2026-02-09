# https://github.com/ribru17/blink-cmp-spell
{
  ...
}:

{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.spell = {
      opts = {
        use_cmp_spell_sorting = true;
      };
    };

    sourcePlugins.spell = {
      enable = true;
    };
  };
}
