{
  ...
}:

{
  programs.nvf.settings.vim = {
    utility.motion = {
      flash-nvim = {
        enable = true; # https://github.com/folke/flash.nvim
        setupOpts = {
          labels = "ntesiroahdlpufyw;q";
          modes = {
            char = {
              jump_labels = true;
            };
          };
        };
      };
    };
  };
}
