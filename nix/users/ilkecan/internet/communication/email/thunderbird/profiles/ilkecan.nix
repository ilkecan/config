{
  config,
  pkgs,
  ...
}:

let
  buildMozillaXpiAddon = pkgs.callPackage pkgs.nur.repos.rycee.lib.mozilla.mkBuildMozillaXpiAddon { };

  darkreader =
    let
      version = "4.9.119";
    in
    buildMozillaXpiAddon {
      inherit version;
      pname = "darkreader";
      addonId = "addon@darkreader.org";
      url = "https://services.addons.thunderbird.net/thunderbird/downloads/latest/darkreader/addon-988542-${version}.xpi";
      sha256 = "sha256-phPXWL3jcs5Hmem/maO5ZZ+6VzbBbJidzdaHjESb5S4=";
      meta = { };
    };

  name = "ilkecan";
in
{
  programs.thunderbird = {
    profiles.${name} = {
      accountsOrder = [
      ];

      calendarAccountsOrder = [
      ];

      extensions = with pkgs.nur.repos.rycee.thunderbird-addons; [
        darkreader
        send-later
      ];

      search = removeAttrs config.programs.firefox.profiles.${name}.search [ "file" ];

      settings = {
        "extensions.autoDisableScopes" = 0;
        "privacy.donottrackheader.enabled" = true;
      };

      userChrome = "";

      userContent = "";
    };
  };
}
