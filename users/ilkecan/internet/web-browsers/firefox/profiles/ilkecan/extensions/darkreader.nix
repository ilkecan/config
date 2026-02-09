{
  pkgs,
  ...
}:

{
  # https://github.com/darkreader/darkreader
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.darkreader ];
    settings."addon@darkreader.org" = {
      permissions = [
        "<all_urls>"
        "alarms"
        "contextMenus"
        "storage"
        "tabs"
        "theme"
      ];

      settings = {
        # https://github.com/darkreader/darkreader/issues/12619
        # https://github.com/darkreader/darkreader/pull/12920
        # https://github.com/darkreader/darkreader/pull/14422
      };
    };
  };
}
