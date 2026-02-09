{
  ...
}:

{
  programs.nvf.settings.vim = {
    visuals = {
      nvim-web-devicons = {
        enable = true;  # https://github.com/nvim-tree/nvim-web-devicons
        setupOpts = {
          default = true;
          strict = true;
        };
      };
    };
  };
}
