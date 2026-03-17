# https://github.com/refractalize/oil-git-status.nvim
{
  pkgs,
  ...
}:

{
  programs.nvf.settings.vim = {
    extraPlugins = {
      oil-git-status-nvim = {
        package = pkgs.unstable.vimPlugins.oil-git-status-nvim;
        setup = ''
          require("oil-git-status").setup()
        '';
      };
    };

    utility.oil-nvim.setupOpts = {
      win_options = {
        signcolumn = "yes:2";
      };
    };
  };
}
