{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.omp;
  yamlFormat = pkgs.formats.yaml { };
  configFile = yamlFormat.generate "omp-config.yml" cfg.settings;
in
{
  options.programs.omp = {
    enable = lib.mkEnableOption "omp";

    package = lib.mkPackageOption pkgs "omp" {
      nullable = true;
      default = null;
    };

    settings = lib.mkOption {
      inherit (yamlFormat) type;
      default = { };
      description = ''
        Read-only settings for omp. `PI_CONFIG_FILES` is used to overlay the
        immutable file on top of the mutable `config.yml` that is managed by
        the `omp` CLI.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.optional (cfg.package != null) cfg.package;
    home.sessionVariables.PI_CONFIG_FILES = "${configFile}";
  };
}
