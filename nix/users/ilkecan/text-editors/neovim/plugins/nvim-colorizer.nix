{
  ...
}:

{
  programs.nvf.settings.vim = {
    ui = {
      colorizer = {
        enable = true;  # https://github.com/catgoose/nvim-colorizer.lua
        setupOpts = {
          filetypes = {
            "css" = {};
            "nix" = {};
            "scss" = {};
          };
        };
      };
    };
  };
}
