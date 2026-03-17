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
        enable = true; # https://github.com/stevearc/oil.nvim
        setupOpts = {
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;
          keymaps = {
            "y." = mkLuaInline ''
              { "actions.copy_entry_path", mode = "n" }
            '';
            "yy" = mkLuaInline ''
              {
                callback = function()
                  local oil = require("oil")
                  local actions = require("oil.actions")
                  local entry = oil.get_cursor_entry()
                  local dir = oil.get_current_dir()

                  if not entry or not dir then
                    return actions.copy_entry_filename.callback()
                  end

                  local git_dir = vim.fs.find(".git", {
                    path = dir,
                    upward = true,
                  })[1]

                  if not git_dir then
                    return actions.copy_entry_filename.callback()
                  end

                  local relative_path = vim.fs.relpath(
                    vim.fs.dirname(git_dir),
                    dir .. entry.name
                  )

                  if not relative_path then
                    return actions.copy_entry_filename.callback()
                  end

                  vim.fn.setreg(vim.v.register, relative_path)
                end,
                desc = "Copy path relative to git root, or filename",
                mode = "n",
              }
            '';
          };
        };

        gitStatus.enable = true; # https://github.com/refractalize/oil-git-status.nvim
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
