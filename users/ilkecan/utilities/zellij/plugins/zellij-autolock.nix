# https://github.com/fresh2dev/zellij-autolock
{
  pkgs,
  ...
}:

{
  # https://github.com/fresh2dev/zellij-autolock#example-configkdl
  programs.zellij.settings = {
    plugins.autolock = {
      _props.location = "file:${pkgs.nur.repos.ilkecan.zellij-autolock}/share/zellij/plugins/zellij-autolock.wasm";

      is_enabled = true;
      triggers = "nvim";
      reaction_seconds = "3";
      # print_to_log = true;
    };

    load_plugins._children = [
      { autolock = {}; }
    ];

    keybinds = {
      normal._children = [
        {
          bind = {
            _args = ["Enter"];
            _children = [
              { WriteChars = "\\u{000D}"; }
              { MessagePlugin._args = ["autolock"]; }
            ];
          };
        }
      ];

      locked._children = [
        {
          bind = {
            _args = ["Alt z"];
            _children = [
              { MessagePlugin = {
                _args = ["autolock"];
                payload = "disable";
              }; }
              { SwitchToMode = "Normal"; }
            ];
          };
        }
      ];

      shared._children = [
        {
          bind = {
            _args = ["Alt Shift z"];
            MessagePlugin = {
              _args = ["autolock"];
              payload = "enable";
            };
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
                  _args = ["Alt z"];
                  _children = [
                    { MessagePlugin = {
                      _args = ["autolock"];
                      payload = "disable";
                    }; }
                    { SwitchToMode = "Locked"; }
                  ];
                };
              }
            ];
          };
        }
      ];
    };
  };
}
