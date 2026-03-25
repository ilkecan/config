{
  panes,
  tabs,
  ...
}:

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
          panes.shell
          (panes.mkFloating panes.shell)
          panes.bar
        ];
      };
    }
  ];
}
