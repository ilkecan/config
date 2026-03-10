# https://github.com/FabijanZulj/blame.nvim
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim = {
    extraPlugins = {
      blame-nvim = {
        package = pkgs.unstable.vimPlugins.blame-nvim;
        setup = ''
          require('blame').setup {
            date_format = "%r",
            format_fn = require("blame.formats.default_formats").date_message,
            merge_consecutive = true,
          }
        '';
      };
    };

    keymaps = [
      {
        desc = "Toggle Git Blame";
        key = "<F3>";
        mode = [ "n" ];
        action = "vim.cmd.BlameToggle";
        lua = true;
      }
    ];
  };
}
