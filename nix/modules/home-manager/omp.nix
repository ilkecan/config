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
  configFileName = ".omp/agent/hm-config.yml";
in
{
  options.programs.omp = {
    enable = lib.mkEnableOption "omp";

    package = lib.mkPackageOption pkgs "omp" {
      nullable = true;
      default = null;
    };

    configFiles = lib.mkOption {
      type = lib.types.listOf lib.types.path;
      default = [ ];
      description = ''
        Additional config overlays loaded before `settings`. Later files
        override earlier files.
      '';
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
    home.file.${configFileName}.source = configFile;
    home.packages = lib.optional (cfg.package != null) cfg.package;
    home.sessionVariables.PI_CONFIG_FILES = lib.concatStringsSep ":" (
      map toString (
        cfg.configFiles
        ++ [
          "${config.home.homeDirectory}/${config.home.file.${configFileName}.target}"
        ]
      )
    );
  };
}
