# https://yalter.github.io/niri/Configuration:-Input
{
  ...
}:

{
  programs.niri.settings.input = {
    focus-follows-mouse = {
      enable = true;
      max-scroll-amount = "0%";
    };

    keyboard = {
      numlock = true;
      xkb = {
        model = "pc105";
        layout = "us,tr";
        variant = "colemak,alt";
        options = "compose:rwin";
      };
    };

    touchpad = {
    };

    mouse = {
    };

    trackpoint = {
    };

    workspace-auto-back-and-forth = true;
  };
}
