{
  config,
  pkgs,
  userConfig,
  ...
}:

{
  programs = {
    ydotool.enable = true; # https://github.com/ReimuNotMoe/ydotool
  };

  services = {
    libinput = {
      enable = true;
      mouse.middleEmulation = false;
    };

    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-elan;
      };
    };
  };

  users.groups = {
    ${config.programs.ydotool.group}.members = [ userConfig.home.username ];
    input.members = [ userConfig.home.username ];
  };
}
