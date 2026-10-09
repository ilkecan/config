{
  pkgs,
  ...
}:

{
  programs.dank-calendar = {
    enable = true;
    package = pkgs.unstable.dankcalendar;
    systemd.enable = true;
    settings = {
    };
  };
}
