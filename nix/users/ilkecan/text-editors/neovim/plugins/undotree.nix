{
  ...
}:

{
  programs.nvf.settings.vim = {
    utility.undotree = {
      enable = true;  # https://github.com/mbbill/undotree
    };

    keymaps = [
      {
        desc = "Toggle Undotree";
        key = "<F4>";
        mode = [ "n" ];
        action = "vim.cmd.UndotreeToggle";
        lua = true;
      }
    ];
  };
}
