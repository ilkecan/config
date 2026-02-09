{
  pkgs,
  ...
}:

{
  # https://github.com/sblask-webextensions/webextension-skip-redirect
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.skip-redirect ];
    settings."skipredirect@sblask" = {
      permissions = [
        "<all_urls>"
        "clipboardWrite"
        "contextMenus"
        "notifications"
        "storage"
        "webRequest"
        "webRequestBlocking"
      ];

      settings = {
        # No-skip-urls-list (you may use regular expressions)
        # ^https?://(www\.)?reddit\.com/media(?:/|\?|$)
        # ^https?://(?:preview|external-preview|i)\.redd\.it/
      };
    };
  };
}
