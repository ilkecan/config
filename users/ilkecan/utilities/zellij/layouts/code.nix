{
  config,
  ...
}:

{
  programs.zellij.layouts.code = {
    layout._children = [
      {
        tab = {
          _props = { name = "Neovim"; focus = true; };
          _children = [
            { pane._props.command = "nvim"; }
            {
              pane = {
                _props = { size = 1; borderless = true; };
                plugin._props.location = "zellij:compact-bar";
              };
            }
          ];
        };
      }
      {
        tab = {
          _props.name = "terminal";
          _children = [
            {
              pane = {
                _props.split_direction = "vertical";
                _children = [
                  { pane._props.command = config.home.defaultShell.meta.mainProgram; }
                  { pane._props = { command = "claude"; }; pane.start_suspended = true; }
                ];
              };
            }
            {
              pane = {
                _props = { size = 1; borderless = true; };
                plugin._props.location = "zellij:compact-bar";
              };
            }
          ];
        };
      }
    ];
  };
}
