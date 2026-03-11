{
  config,
  ...
}:

{
  programs.mosh.enable = true;

  services = {
    fail2ban.enable = true;

    openssh = {
      enable = true;
      settings = {
        AllowUsers = [ config.users.users.ilkecan.name ];
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
