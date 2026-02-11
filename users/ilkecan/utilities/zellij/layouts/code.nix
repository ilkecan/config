{
  ...
}:

{
  programs.zellij.layouts.code = {
    layout._children = [
      {
        tab = {
          _props = { hide_floating_panes = true; };
          _children = [
            {
              pane = {
                _props = { split_direction = "vertical"; };
                _children = [
                  { pane._props = { command = "nvim"; focus = true; }; }
                  { pane = { }; }
                ];
              };
            }
            {
              pane = {
                _props = { size = 1; borderless = true; };
                plugin._props = { location = "zellij:compact-bar"; };
              };
            }
          ];
        };
      }
    ];
  };
}
