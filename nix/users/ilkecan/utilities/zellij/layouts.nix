{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    removeSuffix
    ;

  inherit (lib.my)
    importTree
    ;

  panes = {
    bar = {
      pane = {
        _props = {
          size = 1;
          borderless = true;
        };
        plugin._props.location = "zellij:compact-bar";
      };
    };

    mkFloating = pane: {
      floating_panes = {
        pane = pane.pane // {
          _props = {
            x = "10%";
            y = "10%";
            width = "80%";
            height = "80%";
          }
          // pane.pane._props;
        };
      };
    };

    shell = {
      pane._props.command = config.home.defaultShell.meta.mainProgram;
    };
  };

  tabs = {
    neovim = {
      tab = {
        _props = {
          name = "Neovim";
          focus = true;
          hide_floating_panes = true;
        };

        _children = [
          { pane._props.command = "nvim"; }
          (panes.mkFloating panes.shell)
          panes.bar
        ];
      };
    };
  };
in
{
  programs.zellij.layouts = importTree {
    root = ./layouts;
    depth = 1;
    importFn = x: import x { inherit panes tabs; };
    normalizeNameFn = removeSuffix ".nix";
  };
}
