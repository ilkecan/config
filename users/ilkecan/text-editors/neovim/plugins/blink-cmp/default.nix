# https://github.com/saghen/blink.cmp
{
  lib,
  ...
}:

let
  inherit (lib)
    mkForce
  ;

  inherit (lib.generators)
    mkLuaInline
  ;
in
{
  imports = [
    ./sources
  ];

  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    enable = true;

    # https://cmp.saghen.dev/configuration/reference
    setupOpts = {
      keymap = {
        preset = "enter";
        "<C-e>" = mkForce [ "cancel" "fallback" ];
      };

      completion = {
        keyword.range = "full";
        trigger.show_on_backspace_in_keyword = true;
        list.selection.preselect = false;
        menu.draw.columns =  mkLuaInline ''
          { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } }
        '';
        documentation.auto_show = true;
        ghost_text = {
          enabled = true;
          show_without_selection = true;
        };
      };

      signature.enabled = true;
      fuzzy = {
        implementation = "rust";
        sorts = [
          "exact"
          "score"
          "sort_text"
        ];
      };

      cmdline.completion = {
        menu.auto_show = true;
        list.selection.preselect = false;
      };
    };

    friendly-snippets.enable = true; # https://github.com/rafamadriz/friendly-snippets
  };
}
