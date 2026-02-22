{
  ...
}:

let
  inherit (builtins)
    concatStringsSep
  ;

  comSepList = concatStringsSep ",";
in
{
  programs.firefox = {
    profiles.ilkecan.settings = {
      "browser.download.always_ask_before_handling_new_types" = true;
      "browser.download.forbid_open_with" = true;
      "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "firefox-b";
      "browser.quitShortcut.disabled" = true;
      "browser.translations.automaticallyPopup" = false;  # disable "Always offer to translate"
      "browser.urlbar.suggest.quickactions" = false; # about:preferences#search > Address Bar > Quick Actions
      "devtools.anti-tracking.enabled" = true;
      "devtools.toolbox.host" = "right";
      "intl.accept_languages" = comSepList [ "en" "en-us" "tr" ];
      "media.videocontrols.picture-in-picture.enabled" = false;
      # https://github.com/arkenfox/user.js/issues/1080#issue-774750296
      "privacy.clearHistory.browsingHistoryAndDownloads" = false;
      "mousewheel.with_control.action" = 1;
      "layout.css.devPixelsPerPx" = 2.0;
      "browser.urlbar.resultMenu.keyboardAccessible" = false;

      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.location" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
      "widget.use-xdg-desktop-portal.open-uri" = 1;
      "widget.use-xdg-desktop-portal.settings" = 1;


      "extensions.ml.enabled" = false;
      "pdfjs.enableAltTextModelDownload" = false;
      "pdfjs.enableGuessAltText" = false;
      "pdfjs.enableAltText" = false;
      "pdfjs.enableAltTextForEnglish" = false;

      "extensions.update.autoUpdateDefault" = false;
    };
  };
}
