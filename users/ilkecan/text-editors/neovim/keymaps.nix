{
  ...
}:

{
  programs.nvf.settings.vim = {
    keymaps = [
      {
        desc = "save the buffer";
        key = "<Leader>w";
        mode = [ "n" ];
        action = "vim.cmd.write";
        lua = true;
      }
      {
        desc = "open a new buffer";
        key = "<C-t>";
        mode = [ "n" ];
        action = "vim.cmd.enew";
        lua = true;
      }
      {
        desc = "move to the next buffer";
        key = "<M-Right>";
        mode = [ "n" ];
        action = "vim.cmd.bnext";
        lua = true;
      }
      {
        desc = "move to the previous buffer";
        key = "<M-Left>";
        mode = [ "n" ];
        action = "vim.cmd.bprevious";
        lua = true;
      }
      {
        desc = "move to the next window";
        key = "<C-Right>";
        mode = [ "n" ];
        action = ''function() vim.cmd.wincmd("w") end'';
        lua = true;
      }
      {
        desc = "move to the previous window";
        key = "<C-Left>";
        mode = [ "n" ];
        action = ''function() vim.cmd.wincmd("W") end'';
        lua = true;
      }
      {
        desc = "go back to the previous buffer";
        key = "<C-Tab>";
        mode = [ "n" ];
        action = ''function() vim.cmd.buffer("#") end'';
        lua = true;
      }
      {
        desc = "clear the screen from highlights";
        key = "<Esc>";
        mode = [ "n" ];
        action = ''
          function()
            local key = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
            vim.api.nvim_feedkeys(key, "n", false)
            vim.cmd.nohlsearch()
          end
        '';
        lua = true;
      }
      {
        desc = "delete the last word";
        key = "<C-h>";
        mode = [ "c" "i" ];
        action = "<C-w>";
      }
      {
        desc = "change the behavior of Y to be more consistent with C and D";
        key = "Y";
        mode = [ "n" ];
        action = "y$";
      }
      {
        desc = "revert https://github.com/neovim/neovim/issues/15404";
        key = "Q";
        mode = [ "n" ];
        action = "gQ";
      }
      {
        desc = "press Esc twice to go back to normal mode from terminal mode";
        key = "<Esc><Esc>";
        mode = [ "t" ];
        action = ''[[<C-\><C-n>]]'';
        lua = true;
      }
      {
        key = "<Leader>s";
        mode = [ "n" ];
        action = ''
          function()
            local lnum = vim.fn.line(".")
            vim.cmd.sort { range = { lnum , lnum + vim.v.count1 - 1 } }
          end
        '';
        silent = true;
        lua = true;
      }
      {
        key = "<Leader>s";
        mode = [ "v" ];
        action = ''
          function()
            local range = { vim.fn.line("v"), vim.fn.line(".") }
            table.sort(range)
            vim.cmd.sort { range = range }
            vim.api.nvim_input "<Esc>"
          end
        '';
        silent = true;
        lua = true;
      }
    ];
  };
}
