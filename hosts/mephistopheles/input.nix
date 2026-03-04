{
  pkgs,
  userConfig,
  ...
}:

{
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

  users.groups.input.members = [ userConfig.home.username ];
}
