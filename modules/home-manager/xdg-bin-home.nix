{
  config,
  inputs',
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mapAttrs'
    mkIf
    mkOption
    nameValuePair
    types
  ;

  cfg = config.xdg;

  inherit (config.home)
    homeDirectory
  ;

  fileType = (import "${inputs'.home-manager}/modules/lib/file-type.nix" {
    inherit homeDirectory lib pkgs;
  }).fileType;
in
{
  options = {
    xdg = {
      binFile = mkOption {
        type = fileType "xdg.binFile" "`xdg.binHome`" cfg.binHome;
        default = { };
        description = ''
          Attribute set of files to link into the user's XDG bin home.
        '';
      };

      binHome = mkOption {
        type = types.path;
        default = "${homeDirectory}/.local/bin";
        defaultText = "~/.local/bin";
        apply = toString;
        description = ''
          Absolute path to directory holding user-specific executable files.

          Sets `XDG_BIN_HOME` for the user if `xdg.enable` is set `true`.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      file = mapAttrs' (name: file: nameValuePair "${cfg.binHome}/${name}" file) cfg.binFile;

      sessionVariables = {
        XDG_BIN_HOME = cfg.binHome;
      };

      sessionPath = [
        cfg.binHome
      ];
    };
  };
}
