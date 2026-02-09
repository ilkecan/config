{
  lib,
  ...
}:

let
  inherit (lib.generators)
    mkLuaInline
  ;
in
{
  programs.nvf.settings.vim = {
    utility = {
      oil-nvim = {
        enable = true;  # https://github.com/stevearc/oil.nvim
        setupOpts = {
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;
          keymaps = {
            "y." = mkLuaInline ''
              { "actions.copy_entry_path", mode = "n" };
            '';
          };
        };

        gitStatus.enable = true;  # https://github.com/refractalize/oil-git-status.nvim
      };
    };

    keymaps = [
      {
        key = "<F1>";
        mode = [ "n" ];
        action = ''require("oil").toggle_float'';
        lua = true;
      }
    ];
  };
}
