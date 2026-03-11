{
  pkgs,
  ...
}:

{
  # https://github.com/philc/vimium
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.vimium ];
    settings."{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
      permissions = [
        "<all_urls>"
        "bookmarks"
        "clipboardRead"
        "clipboardWrite"
        "file:///"
        "file:///*/"
        "history"
        "notifications"
        "scripting"
        "search"
        "sessions"
        "storage"
        "tabs"
        "webNavigation"
      ];

      settings = {
        # https://github.com/philc/vimium/issues/4600
      };
    };
  };
}
