# https://github.com/nvim-treesitter/nvim-treesitter-context
{
  ...
}:

{
  programs.nvf.settings.vim = {
    treesitter.context = {
      enable = true;
      setupOpts = {
        enable = false;
      };
    };

    keymaps = [
      {
        desc = "Toggle TS context";
        key = "<F3>";
        mode = [ "n" ];
        action = ''function() vim.cmd.TSContext("toggle") end'';
        lua = true;
      }
    ];
  };
}
