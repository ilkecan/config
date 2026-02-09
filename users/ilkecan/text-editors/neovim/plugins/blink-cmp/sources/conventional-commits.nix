# https://github.com/disrupted/blink-cmp-conventional-commits
{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.generators)
    mkLuaInline
  ;
in
{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.conventional_commits = {
      enabled = mkLuaInline ''
        function()
            return vim.bo.filetype == 'gitcommit'
        end
      '';
    };

    sourcePlugins.conventional_commits = {
      enable = true;
      package = pkgs.vimPlugins.blink-cmp-conventional-commits;
      module = "blink-cmp-conventional-commits";
    };
  };
}
