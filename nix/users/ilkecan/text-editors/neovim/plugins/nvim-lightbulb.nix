{
  ...
}:

{
  programs.nvf.settings.vim = {
    lsp = {
      lightbulb.enable = true;  # https://github.com/kosayoda/nvim-lightbulb
    };

    keymaps = [
      {
        # https://neovim.io/doc/user/lsp.html#vim.lsp.buf.code_action()
        desc = "Selects a code action available at cursor position.";
        key = "<F2>";
        mode = [ "n" ];
        action = "vim.lsp.buf.code_action";
        lua = true;
      }
    ];
  };
}
