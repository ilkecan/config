{
  config,
  ...
}:

let
  name = "ilkecan";
in
{
  programs.thunderbird = {
    profiles.${name} = {
      accountsOrder = [
      ];

      calendarAccountsOrder = [
      ];

      # TODO: add extensions after https://github.com/nix-community/NUR/pull/1088 is resolved
      # extensions = pkgs.nur.repos.rycee.thunderbird-addons; [
      # ];

      search = removeAttrs config.programs.firefox.profiles.${name}.search [ "file" ];

      settings = {
        "extensions.autoDisableScopes" = 0;
        "privacy.donottrackheader.enabled" = true;
      };

      userChrome = ''
      '';

      userContent = ''
      '';
    };
  };
}
