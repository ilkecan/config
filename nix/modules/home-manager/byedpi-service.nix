{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.services.byedpi;
in
{
  options.services.byedpi = {
    enable = lib.mkEnableOption "the ByeDPI service";
    package = lib.mkPackageOption pkgs "byedpi" { };
    extraArgs = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      example = [
        "--disorder"
        "1"
        "--auto=torst"
        "--tlsrec"
        "1+s"
      ];
      description = "Extra command line arguments";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    systemd.user.services.byedpi = {
      Unit = {
        Description = "ByeDPI";
        Documentation = [ "https://github.com/hufrea/byedpi" ];
      };

      Service = {
        ExecStart = lib.escapeShellArgs ([ (lib.getExe cfg.package) ] ++ cfg.extraArgs);
        NoNewPrivileges = true;
        PrivateTmp = true;
        ProtectSystem = "full";
        StandardError = "journal";
        StandardOutput = "null";
        TimeoutStopSec = "5s";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
