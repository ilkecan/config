{
  config,
  lib,
  ...
}:

let
  inherit (builtins)
    attrNames
    attrValues
    concatMap
  ;

  inherit (lib)
    genAttrs
  ;

  cfg = config.programs.firefox;
  extensionIds = concatMap (x: attrNames x.extensions.settings) (attrValues cfg.profiles);
in
{
  programs.firefox.policies = {
    # https://mozilla.github.io/policy-templates/
    # about:policies#documentation
    AutofillAddressEnabled = false;
    AutofillCreditCardEnabled = false;
    # BlockAboutConfig = true;
    DNSOverHTTPS = {
      Enabled = false;
      Locked = true;
    };
    DisableAppUpdate = true;
    DisableFeedbackCommands = true;
    DisableFirefoxAccounts = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableProfileImport = true;
    DisableSafeMode = true;
    DisableSetDesktopBackground = true;
    DisableTelemetry = true;
    DisplayBookmarksToolbar = "always";
    DisplayMenuBar = "never";
    DontCheckDefaultBrowser = true;
    EncryptedMediaExtensions = {
      Enabled = false;
      Locked = true;
    };
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Category = "strict";
      Exceptions = [];
      BaselineExceptions = true;
      ConvenienceExceptions = true;
    };
    ExtensionSettings = {
      "*".installation_mode = "blocked";
    } // genAttrs extensionIds (_: { installation_mode = "force_installed"; private_browsing = true; default_area = "navbar"; });
    ExtensionUpdate = false;
    FirefoxHome = {
      Search = false;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Locked = true;
    };
    FirefoxSuggest = {
      WebSuggestions = false;
      Locked = true;
    };
    GenerativeAI = {
      Enabled = false;
      Locked = true;
    };
    HardwareAcceleration = true;
    Homepage = {
      Locked = true;
      StartPage = "previous-session";
    };
    HttpsOnlyMode = "force_enabled";
    # NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    OverrideFirstRunPage = "";
    OverridePostUpdatePage = "";
    PasswordManagerEnabled = false;
    PDFjs = {
      Enabled = true;
      EnablePermissions = false;
    };
    PictureInPicture = {
      Enabled = false;
      Locked = true;
    };
    SearchEngines = {
      Remove = [
        "Bing"
        "DuckDuckGo"
        "Google"
        "Perplexity"
        "Wikipedia (en)"
      ];
    };
    UserMessaging = {
      # ExtensionRecommendations = false;
      # FeatureRecommendations = false;
      # UrlbarInterventions = false;
      # SkipOnboarding = false;
      MoreFromMozilla = false;
      FirefoxLabs = false;
      Locked = true;
    };
  };
}
