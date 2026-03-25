{
  panes,
  tabs,
  ...
}:

let
  mkCargoPane = args: {
    pane = {
      _props.name = "cargo";
      command = "cargo";
      inherit args;
      start_suspended = true;
    };
  };
in
{
  layout._children = [
    tabs.llmAgent
    tabs.neovim

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
                panes.shell
                {
                  pane = {
                    _props.split_direction = "horizontal";
                    _children = [
                      (mkCargoPane [
                        "clippy"
                        "--all-targets"
                        "--"
                        "--deny"
                        "warnings"
                      ])
                      (mkCargoPane [ "test" ])
                    ];
                  };
                }
              ];
            };
          }

          (panes.mkFloating panes.shell)
          panes.bar
        ];
      };
    }
  ];
}
