{
  pkgs,
  ...
}:

{

  services.automatic-timezoned.package = pkgs.patched.automatic-timezoned;
  systemd.services.automatic-timezoned.serviceConfig.Restart = "always";
}
