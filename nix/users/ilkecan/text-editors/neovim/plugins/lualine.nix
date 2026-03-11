{
  ...
}:

{
  programs.nvf.settings.vim = {
    statusline = {
      lualine = {
        enable = true;  # https://github.com/nvim-lualine/lualine.nvim
        activeSection = {
          a = [
            '' "mode" ''
          ];
          b = [
            '' "branch" ''
            '' "diff" ''
            '' "diagnostics" ''
          ];
          c = [
            '' { "filename", path = 1 } ''
          ];

          x = [
            '' "filetype" ''
            '' "encoding" ''
            '' "fileformat" ''
          ];
          y = [
            '' "progress" ''
          ];
          z = [
            '' "location" ''
          ];
        };

        setupOpts = {
          options = {
            icons_enabled = false;
            component_separators = "|";
            section_separators = "";
          };
          tabline = {
            lualine_a = [
              "buffers"
            ];
            lualine_z = [
              "tabs"
            ];
          };
        };
      };
    };
  };
}
