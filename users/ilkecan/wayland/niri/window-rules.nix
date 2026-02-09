# https://yalter.github.io/niri/Configuration:-Window-Rules
{
  ...
}:

{
  programs.niri.settings.window-rules = [
    {
      matches = [
        {
          app-id = ''^org\.keepassxc\.KeePassXC$'';
        }
      ];
      block-out-from = "screen-capture";
    }
  ];
}
