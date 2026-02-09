{
  ...
}:

{
  programs.nvf.settings.vim = {
    lsp = {
      trouble = {
        enable = true; # https://github.com/folke/trouble.nvim
      };
    };

    # keymaps = [
    #   {
    #     desc = "Diagnostics (Trouble)";
    #     key = "<F2>";
    #     mode = [ "n" ];
    #     action = ''
    #       function()
    #         require("trouble").toggle("diagnostics")
    #       end
    #     '';
    #     lua = true;
    #   }
    # ];
  };
}
