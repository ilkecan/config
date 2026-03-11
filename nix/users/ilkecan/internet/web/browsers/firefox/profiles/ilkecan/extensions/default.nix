{
  ...
}:

{
  # https://gitlab.com/rycee/nur-expressions/-/raw/master/pkgs/firefox-addons/addons.json

  imports = [
    ./darkreader.nix
    ./indie-wiki-buddy.nix
    ./libredirect.nix
    ./ruffle_rs.nix
    ./skip-redirect.nix
    ./steam-database.nix
    ./ublock-origin.nix
    ./vimium.nix
    ./violentmonkey.nix
  ];

  programs.firefox.profiles.ilkecan.extensions = {
    force = true;
    exhaustivePermissions = true;
    exactPermissions = true;
  };
}
