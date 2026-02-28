{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkIf
  ;
in
{
  programs.dank-material-shell.plugins.dockerManager = {
    enable = true;
    settings = {
      dockerBinary = mkIf config.services.podman.enable "podman";
    };
  };
}
