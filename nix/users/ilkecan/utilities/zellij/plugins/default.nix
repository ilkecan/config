{
  ...
}:

{
  imports = [
    ./zellij-autolock.nix
  ];

  programs.zellij.settings = {
    plugins = {
      about._props.location = "zellij:about";
      compact-bar._props.location = "zellij:compat-bar";
      configuration._props.location = "zellij:configuration";
      filepicker = {
        _props.location = "zellij:strider";
        cwd = ["/"];
      };
      plugin-manager._props.location = "zellij:plugin-manager";
      session-manager._props.location = "zellij:session-manager";
      status-bar._props.location = "zellij:status-bar";
      strider._props.location = "zellij:strider";
      tab-bar._props.locatio = "zellij:tab-bar";
      welcome-screen = {
        _props.location = "zellij:session-manager";
        welcome_screen = true;
      };
    };
  };
}
