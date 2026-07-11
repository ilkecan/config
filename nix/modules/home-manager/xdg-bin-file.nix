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
    ;

  cfg = config.xdg;

  inherit (config.home)
    homeDirectory
    ;

  fileType =
    (import "${inputs'.home-manager}/modules/lib/file-type.nix" {
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
    };
  };

  config = mkIf cfg.enable {
    home = {
      file = mapAttrs' (name: file: nameValuePair "${cfg.binHome}/${name}" file) cfg.binFile;
    };
  };
}
