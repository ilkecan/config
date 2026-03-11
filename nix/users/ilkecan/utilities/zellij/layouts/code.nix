{
  config,
  ...
}:

{
  programs.zellij.layouts.code = {
    layout._children = [
      {
        tab = {
          _props = { name = "Neovim"; focus = true; hide_floating_panes = true; };
          _children = [
            { pane._props.command = "nvim"; }
            { floating_panes.pane = {
                _props = { command = "claude"; x = "10%"; y = "10%"; width = "80%"; height = "80%"; };
                args = [ "--ide" ];
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
      {
        tab = {
          _props.name = "terminal";
          _children = [
            { pane._props.command = config.home.defaultShell.meta.mainProgram; }
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
