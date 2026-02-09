{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    ffmpeg-full
    # stremio   # https://github.com/NixOS/nixpkgs/pull/468728
    vlc
  ];

  programs = {
    mpv = {
      enable = true;
      bindings = {
      };
      config = {
        border = "no"; # uosc will draw its own window controls and border if you disable window border
        hwdec = "auto";   # https://wiki.archlinux.org/title/Mpv#Hardware_video_acceleration
        interpolation = "yes";  # https://github.com/tomasklaen/uosc#manual
        osd-bar = "no";   # uosc provides seeking & volume indicators (via flash-timeline and flash-volume commands) if you decide to use them, you don't need osd-bar
        profile = "high-quality";   # https://wiki.archlinux.org/title/Mpv#High_quality_configurations
        sub-auto = "fuzzy";   # https://mpv.io/manual/stable/#options-sub-auto
        video-sync = "display-resample";  # https://github.com/mpv-player/mpv/wiki/Display-synchronization
        vo = "gpu-next";  # https://github.com/mpv-player/mpv/wiki/GPU-Next-vs-GPU
      };

      scripts = with pkgs.mpvScripts; [
        mpris   # https://github.com/hoyon/mpv-mpris
        sponsorblock-minimal  # https://codeberg.org/jouni/mpv_sponsorblock_minimal
        thumbfast   # https://github.com/po5/thumbfast
        uosc  # https://github.com/tomasklaen/uosc
      ];
    };
  };
}
