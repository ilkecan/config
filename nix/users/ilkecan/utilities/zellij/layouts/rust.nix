{
  config,
  ...
}:

{
  layout._children = [
    {
      tab = {
        _props = {
          name = "Neovim";
          focus = true;
          hide_floating_panes = true;
        };
        _children = [
          { pane._props.command = "nvim"; }
          {
            floating_panes.pane._props = {
              command = "codex";
              x = "10%";
              y = "10%";
              width = "80%";
              height = "80%";
            };
          }
          {
            pane = {
              _props = {
                size = 1;
                borderless = true;
              };
              plugin._props.location = "zellij:compact-bar";
            };
          }
        ];
      };
    }
    {
      tab = {
        _props = {
          name = "terminal";
          hide_floating_panes = true;
        };
        _children = [
          {
            pane = {
              _props.split_direction = "vertical";
              _children = [
                { pane._props.command = config.home.defaultShell.meta.mainProgram; }
                {
                  pane = {
                    _props.split_direction = "horizontal";
                    _children = [
                      {
                        cargo.args = [
                          "clippy"
                          "--all-targets"
                          "--"
                          "--deny"
                          "warnings"
                        ];
                      }
                      { cargo.args = [ "test" ]; }
                    ];
                  };
                }
              ];
            };
          }
          {
            floating_panes.pane._props = {
              command = "zsh";
              x = "10%";
              y = "10%";
              width = "80%";
              height = "80%";
            };
          }
          {
            pane = {
              _props = {
                size = 1;
                borderless = true;
              };
              plugin._props.location = "zellij:compact-bar";
            };
          }
        ];
      };
    }
    {
      pane_template = {
        _props.name = "cargo";
        command = "cargo";
        start_suspended = true;
      };
    }
  ];
}
