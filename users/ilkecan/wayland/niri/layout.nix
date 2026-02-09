# https://yalter.github.io/niri/Configuration:-Layout
{
  ...
}:

{
  programs.niri.settings.layout = {
    preset-column-widths = [
      { proportion = 1. / 3.; }
      { proportion = 1. / 2.; }
      { proportion = 2. / 3.; }
    ];

    default-column-width = {
      # proportion = 1. / 2.;
    };

    focus-ring = {
      enable = true;
      active = { color = "#7fc8ff"; };
      inactive = { color = "#505050"; };
    };

    border.enable = false;

    shadow = {
      enable = true;
    };
  };
}
