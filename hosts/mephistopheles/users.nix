{
  config,
  homeConfig,
  ...
}:

{
  programs.zsh.enable = true;

  services = {
    accounts-daemon.enable = true;   # https://danklinux.com/docs/dankmaterialshell/cli-doctor#accountsservice
    userborn.enable = true;  # https://github.com/nikstur/userborn
  };

  users = {
    mutableUsers = false;

    users = {
      ilkecan = {
        hashedPasswordFile = config.sops.secrets.ilkecan-hashed-password.path;
        isNormalUser = true;
        extraGroups = [ config.users.groups.wheel.name ];
        shell = homeConfig.programs.zsh.package;
      };
    };
  };
}
