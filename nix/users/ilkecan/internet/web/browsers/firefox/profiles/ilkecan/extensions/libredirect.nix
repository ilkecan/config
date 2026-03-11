{
  pkgs,
  ...
}:

{
  # https://github.com/libredirect/browser_extension
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.libredirect ];
    settings."7esoorv3@alefvanoon.anonaddy.me" = {
      permissions = [
        "<all_urls>"
        "clipboardWrite"
        "contextMenus"
        "storage"
        "webRequest"
        "webRequestBlocking"
      ];

      settings = {
      };
    };
  };
}
