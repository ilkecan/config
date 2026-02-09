{
  pkgs,
  config,
  ...
}:

let
  inherit (config.home)
    profileDirectory
  ;
in
{
  home.sessionVariables = {
    GST_PLUGIN_PATH = "${profileDirectory}/lib/gstreamer-1.0/";
  };

  home.packages = with pkgs.gst_all_1; [
    # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
    gstreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
    gst-plugins-base
    # Specialized plugins separated by quality
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
    gst-libav
    # Support the Video Audio (Hardware) Acceleration API
    gst-vaapi

    gst-plugins-rs
  ];
}
