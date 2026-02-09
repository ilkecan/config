{
  pkgs,
  ...
}:

{
  # https://github.com/SteamDatabase/BrowserExtension
  programs.firefox.profiles.ilkecan.extensions = {
    packages = [ pkgs.nur.repos.rycee.firefox-addons.steam-database ];
    settings."firefox-extension@steamdb.info" = {
      permissions = [
        "https://steamcommunity.com/*"
        "https://steamcommunity.com/app/*"
        "https://steamcommunity.com/games/*"
        "https://steamcommunity.com/id/*"
        "https://steamcommunity.com/id/*/badges*"
        "https://steamcommunity.com/id/*/gamecards/*"
        "https://steamcommunity.com/id/*/inventory*"
        "https://steamcommunity.com/id/*/recommended/*"
        "https://steamcommunity.com/id/*/stats*"
        "https://steamcommunity.com/id/*/stats/CSGO*"
        "https://steamcommunity.com/linkfilter/*"
        "https://steamcommunity.com/market/*"
        "https://steamcommunity.com/market/multibuy*"
        "https://steamcommunity.com/profiles/*"
        "https://steamcommunity.com/profiles/*/badges*"
        "https://steamcommunity.com/profiles/*/gamecards/*"
        "https://steamcommunity.com/profiles/*/inventory*"
        "https://steamcommunity.com/profiles/*/recommended/*"
        "https://steamcommunity.com/profiles/*/stats*"
        "https://steamcommunity.com/profiles/*/stats/CSGO*"
        "https://steamcommunity.com/sharedfiles/*"
        "https://steamcommunity.com/sharedfiles/filedetails*"
        "https://steamcommunity.com/stats/*/achievements*"
        "https://steamcommunity.com/tradeoffer/*"
        "https://steamcommunity.com/tradingcards/boostercreator*"
        "https://steamcommunity.com/workshop/*"
        "https://steamcommunity.com/workshop/browse*"
        "https://steamcommunity.com/workshop/discussions*"
        "https://steamcommunity.com/workshop/filedetails*"
        "https://steamdb.info/*"
        "https://store.steampowered.com/*"
        "https://store.steampowered.com/account/licenses*"
        "https://store.steampowered.com/account/registerkey*"
        "https://store.steampowered.com/agecheck/*"
        "https://store.steampowered.com/app/*"
        "https://store.steampowered.com/app/*/agecheck"
        "https://store.steampowered.com/bundle/*"
        "https://store.steampowered.com/explore*"
        "https://store.steampowered.com/news/app/*"
        "https://store.steampowered.com/sub/*"
        "https://store.steampowered.com/widget/*"
        "storage"
      ];

      settings = {
      };
    };
  };
}
