{
  ...
}:

{
  programs.firefox = {
    betterfox.profiles.ilkecan = {
      enableAllSections = true;

      settings = {
        peskyfox = {
          mozilla-ui = {
            "browser.profiles.enabled".value = false;
          };

        };

        securefox = {
          containers = {
            "privacy.userContext.ui.enabled".value = false;
          };
        };

        smoothfox = {
          instant-scrolling.enable = true;
        };
      };
    };

    profiles.ilkecan.settings = {
      # BETTERFOX
      ## Fastfox
      ### gfx-rendering-tweaks
      "gfx.webrender.all" = true;
      "gfx.webrender.compositor" = true;
      "gfx.webrender.precache-shaders" = true;
      "gfx.webrender.software.opengl" = true;
      "media.ffmpeg.vaapi.enabled" = true;
      "media.hardware-video-decoding.force-enabled" = true;

      ### memory-cache
      "dom.storage.default_quota" = 20480;

      ### media-cache
      "media.memory_caches_combined_limit_pc_sysmem" = 10;

      ### network
      "network.buffer.cache.size" = 65535;
      "network.buffer.cache.count" = 48;
      "network.http.max-persistent-connections-per-proxy" = 48;

      ### tab-unload
      "browser.tabs.unloadOnLowMemory" = true;
      "browser.low_commit_space_threshold_percent" = 20;

      ## Peskyfox
      ### mozilla-ui
      "browser.tabs.warnOnCloseOtherTabs" = false;
      "widget.gtk.non-native-titlebar-buttons.enabled" = true;
      "browser.urlbar.scotchBonnet.enableOverride" = false;

      ### cookie-banner-handling
      "cookiebanners.service.mode" = 1;
      "cookiebanners.service.mode.privateBrowsing" = 1;

      ### font-appearence
      "gfx.webrender.quality.force-subpixel-aa-where-possible" = true;

      ### url-bar
      "browser.urlbar.suggest.engines" = false;   # about:preferences#search > Address Bar > Suggest search engines to use
      "browser.urlbar.suggest.topsites" = false;  # about:preferences#search > Address Bar > Shortcuts
      "browser.urlbar.maxRichResults" = 5;

      ### autoplay
      "media.autoplay.blocking_policy" = 1;

      ### downloads
      "browser.download.autohideButton" = false;

      ### pdf
      "pdfjs.sidebarViewOnLoad" = 2;

      ### tab-behavior
      "browser.link.open_newwindow.restriction" = 0;
      "widget.gtk.hide-pointer-while-typing.enabled" = false;

      ### keyboard-and-shortcuts
      "browser.ctrlTab.sortByRecentlyUsed" = true;  # Ctrl+Tab cycles through tabs in recently used order

      ### accessibility-and-usability
      "reader.parse-on-load.enabled" = false;

      ### bookmark-management
      "browser.bookmarks.max_backups" = 3;

      ### developer-tools
      "devtools.inspector.showUserAgentStyles" = true;

      ## Securefox
      ### oscp-certs-hpkp
      "security.cert_pinning.enforcement_level" = 2;
      "security.enterprise_roots.enabled" = false;
      "security.certerrors.mitm.auto_enable_enterprise_roots" = false;

      ### ssl-tls
      "security.ssl.require_safe_negotiation" = true;

      ### shutdown-sanitizing
      "privacy.sanitize.sanitizeOnShutdown" = true;
      "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;

      ### proxy-socks-ipv6
      "network.dns.disableIPv6" = true;
      "network.notify.checkForProxies" = false;

      ### passwords
      "signon.autofillForms" = false;
      "signon.generation.enabled" = false;
      "signon.management.page.breach-alerts.enabled" = false;
      "signon.management.page.breachAlertUrl" = "";
      "browser.contentblocking.report.lockwise.enabled" = false;
      "browser.contentblocking.report.lockwise.how_it_works.url" = "";
      "signon.firefoxRelay.feature" = "";
      "signon.storeWhenAutocompleteOff" = false;

      ### extensions
      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.profiles._name_.extensions.packages
      # https://searchfox.org/firefox-main/rev/3d9230cb3475081d20465e3f84b733c572a94513/browser/app/profile/firefox.js#61
      "extensions.autoDisableScopes" = 0;
      "extensions.postDownloadThirdPartyPrompt" = false;
      "privacy.resistFingerprinting.block_mozAddonManager" = true;
      "extensions.webextensions.restrictedDomains" = "";

      ### webrtc
      "media.peerconnection.ice.default_address_only" = true;

      ### plugins
      "browser.eme.ui.enabled" = false;

      ### various
      "devtools.selfxss.count" = 5;

      ### mozilla
      "accessibility.force_disabled" = 1;
      "devtools.accessibility.enabled" = false;
      "browser.firefox-view.feature-tour" = "{\"screen\":\"\",\"complete\":true}";
      "extensions.update.enabled" = false;

      ### detection
      "captivedetect.canonicalURL" = "";
      "network.captive-portal-service.enabled" = false;
      "network.connectivity-service.enabled" = false;
      "extensions.abuseReport.enabled" = false;
      "browser.search.serpEventTelemetryCategorization.enabled" = false;
    };
  };
}
