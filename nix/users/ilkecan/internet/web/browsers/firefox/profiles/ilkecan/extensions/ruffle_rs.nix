{
  pkgs,
  ...
}:

{
  # https://github.com/ruffle-rs/ruffle
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.ruffle_rs ];
    settings."{b5501fd1-7084-45c5-9aa6-567c2fcf5dc6}" = {
      permissions = [
        "<all_urls>"
        "declarativeNetRequestWithHostAccess"
        "scripting"
        "storage"
      ];

      settings = {
      };
    };
  };
}
