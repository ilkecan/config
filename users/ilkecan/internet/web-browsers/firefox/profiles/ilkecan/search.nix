{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    concatStringsSep
    genAttrs
    mapAttrsToList
  ;

  defaultSearchEngines = [
    "7esoorv3@alefvanoon.anonaddy.medefault"  # libredirect
    "bing"
    "ddg"
    "google"
    "perplexity"
    "wikipedia"
  ];
  nixSnowflake = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  cfg = config.programs.firefox.profiles.ilkecan.search;
in
{
  programs.firefox.profiles.ilkecan.search = {
    force = true;
    default = "google2";
    privateDefault = cfg.default;

    order = [
      "google2"
      "duckduckgo"
      "startpage"
      "kagi"

      "wikipedia2"
      "github"
      "youtube"
      "archlinux"
      "urban-dictionary"

      "nixpkgs"
      "nix-packages"
      "nixos-options"
      "home-manager"
      "home-manager-options"
      "nur"
      "nixos-wiki"
      "noogle"
      "nixpkgs-pull-request-tracker"

      "rails"
      "ruby"
      "rubygems"

      "python"
      "pypi"
    ];

    engines = genAttrs defaultSearchEngines (_: { metaData.hidden = true; }) // {
      # NOTE: To be able to define custom engines for the built-in ones both id
      # and name has to be different:
      # - id: we are using `2` as the suffix
      # - name: we are using "zero width space" as the suffix.

      archlinux = {
        name = "ArchWiki";
        urls = [ { template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; } ];
        iconMapObj."16" = "https://wiki.archlinux.org/favicon.ico";
        definedAliases = [ "@archlinux" "@arch" ];
      };

      duckduckgo = {
        name = "DuckDuckGo​";
        urls = [ { template = "https://duckduckgo.com/?q={searchTerms}"; } ];
        iconMapObj."32" = "https://duckduckgo.com/favicon.ico";
        definedAliases = [ "@duckduckgo" "@ddg" ];
      };

      home-manager = {
        name = "Home Manager";
        urls = [ { template = "https://github.com/search?type=code&q=repo:nix-community/home-manager {searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@home-manager" "@hm" ];
      };

      home-manager-options = {
        name = "Home Manager Options";
        urls = [ { template = "https://home-manager-options.extranix.com?query={searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@hmo" ];
      };

      github = {
        name = "GitHub";
        urls = [ { template = "https://github.com/search?type=repositories&q={searchTerms}"; } ];
        iconMapObj."32" = "https://github.com/favicon.ico";
        definedAliases = [ "@github" "@gh" ];
      };

      google2 = {
        name = "Google​";
        urls =
          let
            queryParams = {
              gl = "us";  # for more "globalized" results
              pws = "0";  # disable personalization
              q = "{searchTerms}";
              udm = "14"; # https://udm14.org/
            };
            query = concatStringsSep "&" (mapAttrsToList (k: v: "${k}=${v}") queryParams);
          in
          [ { template = "https://www.google.com/search?${query}"; } ];
        iconMapObj."32" = "https://www.google.com/favicon.ico";
        definedAliases = [ "@google" "@g" ];
      };

      kagi = {
        name = "Kagi";
        urls = [ { template = "https://kagi.com/search?q={searchTerms}"; } ];
        iconMapObj."32" = "https://kagi.com/favicon.ico";
        definedAliases = [ "@kagi" "@k" ];
      };

      nix-packages = {
        name = "Nix Packages";
        urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@np" ];
      };

      nixos-options = {
        name = "NixOS Options";
        urls = [ { template = "https://search.nixos.org/options?query={searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@no" ];
      };

      nixos-wiki = {
        name = "NixOS Wiki";
        urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@nw" ];
      };

      nixpkgs = {
        name = "Nixpkgs";
        urls = [ { template = "https://github.com/search?type=code&q=repo:NixOS/nixpkgs {searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@nixpkgs" "@pkgs" ];
      };

      nixpkgs-pull-request-tracker = {
        name = "Nixpkgs Pull Request Tracker";
        urls = [ { template = "https://nixpk.gs/pr-tracker.html?pr={searchTerms}"; } ];
        definedAliases = [ "@nprt" "@npr" ];
      };

      noogle = {
        name = "Noogle";
        urls = [ { template = "https://noogle.dev?term={searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@noogle" "@nog" ];
      };

      nur = {
        name = "NUR";
        urls = [ { template = "https://nur.nix-community.org/?query={searchTerms}"; } ];
        icon = nixSnowflake;
        definedAliases = [ "@nur" ];
      };

      pypi = {
        name = "PyPI";
        urls = [ { template = "https://pypi.org/search/?q={searchTerms}"; } ];
        iconMapObj."32" = "https://pypi.org/favicon.ico";
        definedAliases = [ "@pypi" ];
      };

      python = {
        name = "Python documentation";
        urls = [ { template = "https://docs.python.org/3/search.html?q={searchTerms}"; } ];
        iconMapObj."48" = "https://docs.python.org/favicon.ico";
        definedAliases = [ "@python" "@py" ];
      };

      rails = {
        name = "Ruby on Rails API";
        urls = [ { template = "https://api.rubyonrails.org/?q={searchTerms}"; } ];
        iconMapObj."64"= "https://api.rubyonrails.org/favicon.ico";
        definedAliases = [ "@rails" "@r" ];
      };

      ruby = {
        name = "Documenation for Ruby";
        urls = [ { template = "https://docs.ruby-lang.org/en/4.0/?q={searchTerms}"; } ];
        iconMapObj."32" = "https://docs.ruby-lang.org/favicon.ico";
        definedAliases = [ "@ruby" "@rb" ];
      };

      rubygems = {
        name = "RubyGems";
        urls = [ { template = "https://rubygems.org/search?query={searchTerms}"; } ];
        iconMapObj."256" = "https://rubygems.org/favicon.ico";
        definedAliases = [ "@rubygems" "@rg" "@gem" ];
      };

      startpage = {
        name = "StartPage";
        urls = [ { template = "https://www.startpage.com/sp/search?query={searchTerms}"; } ];
        iconMapObj."32" = "https://www.startpage.com/favicon.ico";
        definedAliases = [ "@startpage" "@sp" ];
      };

      urban-dictionary = {
        name = "Urban Dictionary";
        urls = [ { template = "https://www.urbandictionary.com/define.php?term={searchTerms}"; } ];
        iconMapObj."48" = "https://www.urbandictionary.com/favicon.ico";
        definedAliases = [ "@urban" ];
      };

      wikipedia2 = {
        name = "Wikipedia";
        urls = [ { template = "https://en.wikipedia.org/w/index.php?search={searchTerms}"; } ];
        iconMapObj."48" = "https://en.wikipedia.org/favicon.ico";
        definedAliases = [ "@wikipedia" "@wiki" "@wk" ];
      };

      youtube = {
        name = "YouTube";
        urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
        iconMapObj."16" = "https://www.youtube.com/favicon.ico";
        definedAliases = [ "@youtube" "@yt" "@y" ];
      };
    };
  };
}
