# https://niri-wm.github.io/niri/Configuration:-Window-Rules
{
  ...
}:

{
  programs.niri.settings.window-rules = [
    {
      matches = [ { app-id = ''^alacritty-config$''; } ];
      open-maximized = true;
      open-on-workspace = "config";
    }
    {
      matches = [ { app-id = ''^alacritty-nixpkgs$''; } ];
      open-maximized = true;
      open-on-workspace = "nixpkgs";
    }
    {
      matches = [ { app-id = ''^alacritty-review$''; } ];
      open-maximized = true;
      open-on-workspace = "review";
    }
    {
      matches = [ { app-id = ''^chromium-browser$''; } ];
      open-maximized = true;
      open-on-workspace = "browser";
    }
    {
      matches = [ { app-id = ''^com\.github\.wwmm\.easyeffects$''; } ];
      open-maximized = true;
      open-on-workspace = "settings";
    }
    {
      matches = [ { app-id = ''^com\.saivert\.pwvucontrol$''; } ];
      open-maximized = true;
      open-on-workspace = "settings";
    }
    {
      matches = [ { app-id = ''^org.quickshell$''; } ];
      open-maximized = true;
      open-on-workspace = "settings";
    }
    {
      matches = [ { app-id = ''^firefox$''; } ];
      open-maximized = true;
      open-on-workspace = "browser";
    }
    {
      matches = [ { app-id = ''^fluffychat$''; } ];
      block-out-from = "screen-capture";
      open-maximized = true;
      open-on-workspace = "messaging";
    }
    {
      matches = [ { app-id = ''^io\.github\.kaii_lb\.Overskride$''; } ];
      open-maximized = true;
      open-on-workspace = "settings";
    }
    {
      matches = [ { app-id = ''^io\.gitlab\.news_flash\.NewsFlash$''; } ];
      open-maximized = true;
      open-on-workspace = "news";
    }
    {
      matches = [ { app-id = ''^itch$''; } ];
      open-maximized = true;
      open-on-workspace = "gaming";
    }
    {
      matches = [ { app-id = ''^org\.gnome\.Nautilus$''; } ];
      open-maximized = true;
      open-on-workspace = "files";
    }
    {
      matches = [ { app-id = ''^org\.keepassxc\.KeePassXC$''; } ];
      block-out-from = "screen-capture";
      open-maximized = true;
      open-on-workspace = "password";
    }
    {
      matches = [ { app-id = ''^org\.telegram\.desktop$''; } ];
      block-out-from = "screen-capture";
      open-maximized = true;
      open-on-workspace = "messaging";
    }
    {
      matches = [ { app-id = ''^solaar$''; } ];
      open-maximized = true;
      open-on-workspace = "settings";
    }
    {
      matches = [ { app-id = ''^steam$''; } ];
      block-out-from = "screen-capture";
      open-on-workspace = "gaming";
    }
    {
      matches = [ { app-id = ''^thunderbird$''; } ];
      block-out-from = "screen-capture";
      open-maximized = true;
      open-on-workspace = "news";
    }
    {
      matches = [ { app-id = ''^wasistlos$''; } ];
      block-out-from = "screen-capture";
      open-maximized = true;
      open-on-workspace = "messaging";
    }
  ];
}
