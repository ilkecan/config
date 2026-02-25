{
  pkgs,
  ...
}:

{
  environment.variables.ENVFS_RESOLVE_ALWAYS = "1";

  services.envfs = {
    # https://github.com/Mic92/envfs
    enable = true;
    extraFallbackPathCommands = ''
      ln -s ${pkgs.bash}/bin/bash $out/bash
    '';
  };
}
