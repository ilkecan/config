{
  pkgs,
  ...
}:

{
  # https://github.com/violentmonkey/violentmonkey
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.violentmonkey ];
    settings."{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = {
      permissions = [
        "<all_urls>"
        "clipboardWrite"
        "contextMenus"
        "cookies"
        "notifications"
        "storage"
        "tabs"
        "unlimitedStorage"
        "webRequest"
        "webRequestBlocking"
      ];

      settings = {
      };
    };
  };
}
