{
  ...
}:

{
  programs.zellij.settings.keybinds = {
    _props.clear-defaults = true;

    locked._children = [
      {
        bind = {
          _args = ["Ctrl g"];
          SwitchToMode = "normal";
        };
      }
    ];

    pane._children = [
      {
        bind = {
          _args = ["left"];
          MoveFocus = ["left"];
        };
      }
      {
        bind = {
          _args = ["down"];
          MoveFocus = ["down"];
        };
      }
      {
        bind = {
          _args = ["up"];
          MoveFocus = ["up"];
        };
      }
      {
        bind = {
          _args = ["right"];
          MoveFocus = ["right"];
        };
      }
      {
        bind = {
          _args = ["c"];
          _children = [
            { SwitchToMode = ["renamepane"]; }
            { PaneNameInput = [0]; }
          ];
        };
      }
      {
        bind = {
          _args = ["d"];
          _children = [
            { NewPane = ["down"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["e"];
          _children = [
            { TogglePaneEmbedOrFloating = []; }
            { SwitchToMode = [ "normal" ]; }
          ];
        };
      }
      {
        bind = {
          _args = ["f"];
          _children = [
            { ToggleFocusFullscreen = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["h"];
          MoveFocus = ["left"];
        };
      }
      {
        bind = {
          _args = ["i"];
          _children = [
            { TogglePanePinned = []; }
            { SwitchToMode = [ "normal" ]; }
          ];
        };
      }
      {
        bind = {
          _args = ["j"];
          MoveFocus = ["down"];
        };
      }
      {
        bind = {
          _args = ["k"];
          MoveFocus = ["up"];
        };
      }
      {
        bind = {
          _args = ["l"];
          MoveFocus = ["right"];
        };
      }
      {
        bind = {
          _args = ["n"];
          _children = [
            { NewPane = []; }
            { SwitchToMode = [ "normal" ]; }
          ];
        };
      }
      {
        bind = {
          _args = ["p"];
          SwitchFocus = [];
        };
      }
      {
        bind = {
          _args = ["Ctrl p"];
          SwitchToMode = [ "normal" ];
        };
      }
      {
        bind = {
          _args = ["r"];
          _children = [
            { NewPane = [ "right" ]; }
            { SwitchToMode = [ "normal" ]; }
          ];
        };
      }
      {
        bind = {
          _args = ["s"];
          _children = [
            { NewPane = ["stacked"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["w"];
          _children = [
            { ToggleFloatingPanes = []; }
            { SwitchToMode = [ "normal" ]; }
          ];
        };
      }
      {
        bind = {
          _args = ["z"];
          _children = [
            { TogglePaneFrames = []; }
            { SwitchToMode = [ "normal" ]; }
          ];
        };
      }
    ];

    tab._children = [
      {
        bind = {
          _args = ["up"];
          GoToPreviousTab = [];
        };
      }
      {
        bind = {
          _args = ["right"];
          GoToNextTab = [];
        };
      }
      {
        bind = {
          _args = ["1"];
          _children = [
            { GoToTab = [1]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["2"];
          _children = [
            { GoToTab = [2]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["3"];
          _children = [
            { GoToTab = [3]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["4"];
          _children = [
            { GoToTab = [4]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["5"];
          _children = [
            { GoToTab = [5]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["6"];
          _children = [
            { GoToTab = [6]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["7"];
          _children = [
            { GoToTab = [7]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["8"];
          _children = [
            { GoToTab = [8]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["9"];
          _children = [
            { GoToTab = [9]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["["];
          _children = [
            { BreakPaneLeft = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["]"];
          _children = [
            { BreakPaneRight = [ ]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["b"];
          _children = [
            { BreakPane = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["h"];
          GoToPreviousTab = [];
        };
      }
      {
        bind = {
          _args = ["j"];
          GoToNextTab = [];
        };
      }
      {
        bind = {
          _args = ["k"];
          GoToPreviousTab = [];
        };
      }
      {
        bind = {
          _args = ["l"];
          GoToNextTab = [];
        };
      }
      {
        bind = {
          _args = ["n"];
          _children = [
            { NewTab = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["r"];
          _children = [
            { SwitchToMode = ["renametab"]; }
            { TabNameInput = [0]; }
          ];
        };
      }
      {
        bind = {
          _args = ["s"];
          _children = [
            { ToggleActiveSyncTab = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["Ctrl t"];
          SwitchToMode = ["normal"];
        };
      }
      {
        bind = {
          _args = ["x"];
          _children = [
            { CloseTab = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["tab"];
          ToggleTab = [];
        };
      }
    ];

    resize._children = [
      {
        bind = {
          _args = ["left"];
          Resize = ["Increase left"];
        };
      }
      {
        bind = {
          _args = ["down"];
          Resize = ["Increase down"];
        };
      }
      {
        bind = {
          _args = ["up"];
          Resize = ["Increase up"];
        };
      }
      {
        bind = {
          _args = ["right"];
          Resize = ["Increase right"];
        };
      }
      {
        bind = {
          _args = ["+"];
          Resize = ["Increase"];
        };
      }
      {
        bind = {
          _args = ["-"];
          Resize = ["Decrease"];
        };
      }
      {
        bind = {
          _args = ["="];
          Resize = ["Increase"];
        };
      }
      {
        bind = {
          _args = ["H"];
          Resize = ["Decrease left"];
        };
      }
      {
        bind = {
          _args = ["J"];
          Resize = ["Decrease down"];
        };
      }
      {
        bind = {
          _args = ["K"];
          Resize = ["Decrease up"];
        };
      }
      {
        bind = {
          _args = ["L"];
          Resize = ["Decrease right"];
        };
      }
      {
        bind = {
          _args = ["h"];
          Resize = ["Increase left"];
        };
      }
      {
        bind = {
          _args = ["j"];
          Resize = ["Increase down"];
        };
      }
      {
        bind = {
          _args = ["k"];
          Resize = ["Increase up"];
        };
      }
      {
        bind = {
          _args = ["l"];
          Resize = ["Increase right"];
        };
      }
      {
        bind = {
          _args = ["Ctrl n"];
          SwitchToMode = ["normal"];
        };
      }
    ];

    move._children = [
      {
        bind = {
          _args = ["left"];
          MovePane = ["left"];
        };
      }
      {
        bind = {
          _args = ["down"];
          MovePane = ["down"];
        };
      }
      {
        bind = {
          _args = ["up"];
          MovePane = ["up"];
        };
      }
      {
        bind = {
          _args = ["right"];
          MovePane = ["right"];
        };
      }
      {
        bind = {
          _args = ["h"];
          MovePane = ["left"];
        };
      }
      {
        bind = {
          _args = ["Ctrl h"];
          SwitchToMode = ["normal"];
        };
      }
      {
        bind = {
          _args = ["j"];
          MovePane = ["down"];
        };
      }
      {
        bind = {
          _args = ["k"];
          MovePane = ["up"];
        };
      }
      {
        bind = {
          _args = ["l"];
          MovePane = ["right"];
        };
      }
      {
        bind = {
          _args = ["n"];
          MovePane = [];
        };
      }
      {
        bind = {
          _args = ["p"];
          MovePaneBackwards = [];
        };
      }
      {
        bind = {
          _args = ["tab"];
          MovePane = [];
        };
      }
    ];

    scroll._children = [
      {
        bind = {
          _args = ["e"];
          _children = [
            { EditScrollback = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["s"];
          _children = [
            { SwitchToMode = ["entersearch"]; }
            { SearchInput = [0]; }
          ];
        };
      }
    ];

    search._children = [
      {
        bind = {
          _args = ["c"];
          SearchToggleOption = ["CaseSensitivity"];
        };
      }
      {
        bind = {
          _args = ["n"];
          Search = ["down"];
        };
      }
      {
        bind = {
          _args = ["o"];
          SearchToggleOption = ["WholeWord"];
        };
      }
      {
        bind = {
          _args = ["p"];
          Search = ["up"];
        };
      }
      {
        bind = {
          _args = ["w"];
          SearchToggleOption = ["Wrap"];
        };
      }
    ];

    session._children = [
      {
        bind = {
          _args = ["a"];
          _children = [
            {
              LaunchOrFocusPlugin = {
                _args = ["zellij:about"];
                floating = true;
                move_to_focused_tab = true;
              };
            }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["c"];
          _children = [
            {
              LaunchOrFocusPlugin = {
                _args = ["configuration"];
                floating = true;
                move_to_focused_tab = true;
              };
            }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["Ctrl o"];
          SwitchToMode = ["normal"];
        };
      }
      {
        bind = {
          _args = ["p"];
          _children = [
            {
              LaunchOrFocusPlugin = {
                _args = ["plugin-manager"];
                floating = true;
                move_to_focused_tab = true;
              };
            }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["s"];
          _children = [
            {
              LaunchOrFocusPlugin = {
                _args = ["zellij:share"];
                floating = true;
                move_to_focused_tab = true;
              };
            }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["w"];
          _children = [
            {
              LaunchOrFocusPlugin = {
                _args = ["session-manager"];
                floating = true;
                move_to_focused_tab = true;
              };
            }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
    ];

    entersearch._children = [
      {
        bind = {
          _args = ["Ctrl c"];
          SwitchToMode = "scroll";
        };
      }
      {
        bind = {
          _args = ["esc"];
          SwitchToMode = "scroll";
        };
      }
      {
        bind = {
          _args = ["enter"];
          SwitchToMode = "search";
        };
      }
    ];

    renametab._children = [
      {
        bind = {
          _args = ["esc"];
          _children = [
            { UndoRenameTab = []; }
            { SwitchToMode = ["tab"]; }
          ];
        };
      }
    ];

    renamepane._children = [
      {
        bind = {
          _args = ["esc"];
          _children = [
            { UndoRenamePane = []; }
            { SwitchToMode = ["pane"]; }
          ];
        };
      }
    ];

    tmux._children = [
      {
        bind = {
          _args = ["left"];
          _children = [
            { MoveFocus = ["left"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["down"];
          _children = [
            { MoveFocus = ["down"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["up"];
          _children = [
            { MoveFocus = ["up"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["right"];
          _children = [
            { MoveFocus = ["right"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["space"];
          NextSwapLayout = [];
        };
      }
      {
        bind = {
          _args = ["\""];
          _children = [
            { NewPane = ["down"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["%"];
          _children = [
            { NewPane = ["right"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = [","];
          SwitchToMode = ["renametab"];
        };
      }
      {
        bind = {
          _args = ["["];
          SwitchToMode = ["scroll"];
        };
      }
      {
        bind = {
          _args = ["Ctrl b"];
          _children = [
            { Write = [2]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["c"];
          _children = [
            { NewTab = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["h"];
          _children = [
            { MoveFocus = ["left"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["j"];
          _children = [
            { MoveFocus = ["down"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["k"];
          _children = [
            { MoveFocus = ["up"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["l"];
          _children = [
            { MoveFocus = ["right"]; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["n"];
          _children = [
            { GoToNextTab = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["o"];
          _children = [
            { FocusNextPane = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["p"];
          _children = [
            { GoToPreviousTab = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
      {
        bind = {
          _args = ["z"];
          _children = [
            { ToggleFocusFullscreen = []; }
            { SwitchToMode = ["normal"]; }
          ];
        };
      }
    ];

    _children = [
      {
        shared_except = {
          _args = ["locked"];
          _children = [
            {
              bind = {
                _args = ["Alt left"];
                MoveFocusOrTab = ["left"];
              };
            }
            {
              bind = {
                _args = ["Alt down"];
                MoveFocus = ["down"];
              };
            }
            {
              bind = {
                _args = ["Alt up"];
                MoveFocus = ["up"];
              };
            }
            {
              bind = {
                _args = ["Alt right"];
                MoveFocusOrTab = ["right"];
              };
            }
            {
              bind = {
                _args = ["Alt +"];
                Resize = ["Increase"];
              };
            }
            {
              bind = {
                _args = ["Alt -"];
                Resize = ["Decrease"];
              };
            }
            {
              bind = {
                _args = ["Alt ="];
                Resize = ["Increase"];
              };
            }
            {
              bind = {
                _args = ["Alt ["];
                PreviousSwapLayout = [];
              };
            }
            {
              bind = {
                _args = ["Alt ]"];
                NextSwapLayout = [];
              };
            }
            {
              bind = {
                _args = ["Alt f"];
                ToggleFloatingPanes = [];
              };
            }
            {
              bind = {
                _args = ["Ctrl g"];
                SwitchToMode = ["locked"];
              };
            }
            {
              bind = {
                _args = ["Alt h"];
                MoveFocusOrTab = ["left"];
              };
            }
            {
              bind = {
                _args = ["Alt i"];
                MoveTab = ["left"];
              };
            }
            {
              bind = {
                _args = ["Alt j"];
                MoveFocus = ["down"];
              };
            }
            {
              bind = {
                _args = ["Alt k"];
                MoveFocus = ["up"];
              };
            }
            {
              bind = {
                _args = ["Alt l"];
                MoveFocusOrTab = ["right"];
              };
            }
            {
              bind = {
                _args = ["Alt n"];
                NewPane = [];
              };
            }
            {
              bind = {
                _args = ["Alt o"];
                MoveTab = ["right"];
              };
            }
            {
              bind = {
                _args = ["Alt p"];
                TogglePaneInGroup = [];
              };
            }
            {
              bind = {
                _args = ["Alt Shift p"];
                ToggleGroupMarking = [];
              };
            }
            {
              bind = {
                _args = ["Ctrl q"];
                Quit = [];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "move"];
          _children = [
            {
              bind = {
                _args = ["Ctrl h"];
                SwitchToMode = ["move"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "session"];
          _children = [
            {
              bind = {
                _args = ["Ctrl o"];
                SwitchToMode = ["session"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "scroll" "search" "tmux"];
          _children = [
            {
              bind = {
                _args = ["Ctrl b"];
                SwitchToMode = ["tmux"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "scroll" "search"];
          _children = [
            {
              bind = {
                _args = ["Ctrl s"];
                SwitchToMode = ["scroll"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "tab"];
          _children = [
            {
              bind = {
                _args = ["Ctrl t"];
                SwitchToMode = ["tab"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "pane"];
          _children = [
            {
              bind = {
                _args = ["Ctrl p"];
                SwitchToMode = ["pane"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["locked" "resize"];
          _children = [
            {
              bind = {
                _args = ["Ctrl n"];
                SwitchToMode = ["resize"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["normal" "locked" "entersearch"];
          _children = [
            {
              bind = {
                _args = ["enter"];
                SwitchToMode = ["normal"];
              };
            }
          ];
        };
      }
      {
        shared_except = {
          _args = ["normal" "locked" "entersearch" "renametab" "renamepane"];
          _children = [
            {
              bind = {
                _args = ["esc"];
                SwitchToMode = ["normal"];
              };
            }
          ];
        };
      }
      {
        shared_among = {
          _args = ["pane" "tmux"];
          _children = [
            {
              bind = {
                _args = ["x"];
                _children = [
                  { CloseFocus = []; }
                  { SwitchToMode = ["normal"]; }
                ];
              };
            }
          ];
        };
      }
      {
        shared_among = {
          _args = ["scroll" "search"];
          _children = [
            {
              bind = {
                _args = ["PageDown"];
                PageScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["PageUp"];
                PageScrollUp = [];
              };
            }
            {
              bind = {
                _args = ["left"];
                PageScrollUp = [];
              };
            }
            {
              bind = {
                _args = ["down"];
                ScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["up"];
                ScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["right"];
                PageScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["Ctrl b"];
                PageScrollUp = [];
              };
            }
            {
              bind = {
                _args = ["Ctrl c"];
                _children = [
                  { ScrollToBottom = []; }
                  { SwitchToMode = ["normal"]; }
                ];
              };
            }
            {
              bind = {
                _args = ["d"];
                HalfPageScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["Ctrl f"];
                PageScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["h"];
                PageScrollUp = [];
              };
            }
            {
              bind = {
                _args = ["j"];
                ScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["k"];
                ScrollUp = [];
              };
            }
            {
              bind = {
                _args = ["l"];
                PageScrollDown = [];
              };
            }
            {
              bind = {
                _args = ["Ctrl s"];
                SwitchToMode = ["normal"];
              };
            }
            {
              bind = {
                _args = ["u"];
                HalfPageScrollUp = [];
              };
            }
          ];
        };
      }
      {
        shared_among = {
          _args = ["renametab" "renamepane"];
          _children = [
            {
              bind = {
                _args = ["Ctrl c"];
                SwitchToMode = ["normal"];
              };
            }
          ];
        };
      }
      {
        shared_among = {
          _args = ["session" "tmux"];
          _children = [
            {
              bind = {
                _args = ["d"];
                Detach = [];
              };
            }
          ];
        };
      }
    ];
  };
}
