# https://github.com/mikavilpas/blink-ripgrep.nvim
{
  config,
  ...
}:

let
  inherit (config.home)
    homeDirectory
  ;
in
{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.ripgrep = {
      opts = {
        backend = {
          use = "gitgrep-or-ripgrep";

          ripgrep = {
            additional_rg_options = [
              "--follow"
            ];

            ignore_paths = [
              homeDirectory
            ];
          };
        };
      };
    };

    sourcePlugins.ripgrep = {
      enable = true;
    };
  };
}
