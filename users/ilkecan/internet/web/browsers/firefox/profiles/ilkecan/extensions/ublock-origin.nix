{
  pkgs,
  ...
}:

{
  # https://github.com/gorhill/uBlock
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.ublock-origin ];
    settings."uBlock0@raymondhill.net" = {
      permissions = [
        "<all_urls>"
        "alarms"
        "dns"
        "file://*/*"
        "http://*/*"
        "https://*.fanboy.co.nz/*"
        "https://*.github.io/*"
        "https://*.reddit.com/r/uBlockOrigin/*"
        "https://*/*"
        "https://easylist.to/*"
        "https://filterlists.com/*"
        "https://forums.lanik.us/*"
        "https://github.com/*"
        "https://github.com/uBlockOrigin/*"
        "https://ublockorigin.github.io/*"
        "menus"
        "privacy"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webNavigation"
        "webRequest"
        "webRequestBlocking"
      ];

      settings = {
        advancedUserEnabled = true;

        popupPanelSections = 31;
        localStorage = {
          dashboardLastVisitedPane = "dyna-rules.html";
        };

        selectedFilterLists = [
          "TUR-0"
          "adguard-spyware-url"
          "easylist"
          "easylist-annoyances"
          "easylist-chat"
          "easylist-newsletters"
          "easylist-notifications"
          "easyprivacy"
          "fanboy-cookiemonster"
          "fanboy-social"
          "plowe-0"
          "ublock-annoyances"
          "ublock-badware"
          "ublock-cookies-easylist"
          "ublock-filters"
          "ublock-privacy"
          "ublock-quick-fixes"
          "ublock-unbreak"
          "urlhaus-1"
          "user-filters"
        ];

        whitelist = [
          "chrome-extension-scheme"
          "moz-extension-scheme"
        ];

        hostnameSwitchesString = ''
          no-large-media: behind-the-scene false
          no-csp-reports: * true
        '';

        dynamicFilteringString = ''
          behind-the-scene * * noop
          behind-the-scene * 1p-script noop
          behind-the-scene * 3p noop
          behind-the-scene * 3p-frame noop
          behind-the-scene * 3p-script noop
          behind-the-scene * image noop
          behind-the-scene * inline-script noop

          claude.ai claude.ai * noop
          www.protondb.com www.protondb.com * noop
        '';
      };
    };
  };
}
