{
  config,
  ...
}:

{
  programs.thunderbird = {
    enable = true;
    profiles = {
      ilkecan = {
        isDefault = true;

        accountsOrder = [
        ];

        calendarAccountsOrder = [
        ];

        extensions = [
        ];

        # search = config.programs.firefox.profiles.ilkecan.search;

        settings = {
        };

        userChrome = ''
        '';

        userContent = ''
        '';
      };
    };
  };
}
