# https://github.com/coder/claudecode.nvim
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
  programs.nvf.settings.vim = {
    extraPlugins = {
      claudecode-nvim = {
        package = pkgs.unstable.vimPlugins.claudecode-nvim;
        setup = ''
          require("claudecode").setup({
            terminal = {
              provider = "none",
            },
          })
        '';
      };
    };

    autocmds = [
      {
        event = [ "FileType" ];
        pattern = [
          "NvimTree"
          "neo-tree"
          "oil"
          "minifiles"
          "netrw"
        ];
        callback = mkLuaInline ''
          function()
            vim.keymap.set("n", "<Leader>as", vim.cmd.ClaudeCodeTreeAdd, { desc = "Add file", buffer = true })
          end
        '';
      }
    ];

    keymaps = [
      {
        desc = "Add current buffer";
        key = "<Leader>ab";
        mode = [ "n" ];
        action = "function() vim.cmd.ClaudeCodeAdd('%') end";
        lua = true;
      }
      {
        desc = "Send to Claude";
        key = "<Leader>as";
        mode = [ "v" ];
        action = "vim.cmd.ClaudeCodeSend";
        lua = true;
      }
      {
        desc = "Accept diff";
        key = "<Leader>aa";
        mode = [ "n" ];
        action = "vim.cmd.ClaudeCodeDiffAccept";
        lua = true;
      }
      {
        desc = "Deny diff";
        key = "<Leader>ad";
        mode = [ "n" ];
        action = "vim.cmd.ClaudeCodeDiffDeny";
        lua = true;
      }
    ];
  };
}
