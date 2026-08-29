{
  pkgs,
  ...
}:

{
  # https://github.com/KevinPayravi/indie-wiki-buddy
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.indie-wiki-buddy ];
    settings."{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = {
      permissions = [
        "alarms"
        "https://*.fandom.com/*"
        "https://*.fextralife.com/*"
        "https://*.neoseeker.com/*"
        "https://breezewiki.com/*"
        "https://www.google.com/search*"
        "notifications"
        "scripting"
        "storage"
        "webRequest"
      ];

      settings = {
      };
    };
  };
}
