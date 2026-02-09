{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim.extraPlugins = {
    nvim-ts-autotag = {
      # https://github.com/windwp/nvim-ts-autotag
      package = pkgs.vimPlugins.nvim-ts-autotag;
      setup = ''
        require('nvim-ts-autotag').setup({
        })
      '';
    };
  };
}
