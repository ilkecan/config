# https://github.com/folke/snacks.nvim
{
  ...
}:

{
  programs.nvf.settings.vim = {
    utility = {
      snacks-nvim = {
        enable = true;
        setupOpts = {
          picker = {
            enabled = true;
          };
        };
      };
    };

    keymaps = map (x: x // { mode = [ "n" ]; lua = true; }) [
      {
        desc = "Snacks all pickers";
        key = "<Leader><Space>";
        action = ''
          function()
            Snacks.picker()
          end
        '';
      }
      {
        desc = "Snacks buffer picker";
        key = "<Leader>b";
        action = "Snacks.picker.buffers";
      }
      {
        desc = "Snacks buffer diagnostics picker";
        key = "<Leader>d";
        action = "Snacks.picker.diagnostics_buffer";
      }
      {
        desc = "Snacks files picker";
        key = "<Leader>f";
        action = ''
          function()
            local result = vim.system({'git', 'rev-parse', '--is-inside-work-tree'}, {
              cwd = vim.fn.getcwd(),
              text = true,
            }):wait()

            if result.code == 0 then
              Snacks.picker.git_files()
            else
              Snacks.picker.files()
            end
          end
        '';
      }
      {
        desc = "Snacks grep picker";
        key = "<Leader>g";
        action = ''
          function()
            local result = vim.system({'git', 'rev-parse', '--is-inside-work-tree'}, {
              cwd = vim.fn.getcwd(),
              text = true,
            }):wait()

            if result.code == 0 then
              Snacks.picker.git_grep()
            else
              Snacks.picker.grep({
                follow = true
              })
            end
          end
        '';
      }
    ];
  };
}
