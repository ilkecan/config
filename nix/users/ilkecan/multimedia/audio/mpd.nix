{
  ...
}:

{
  services = {
    mpd = {
      enable = true;
      network.startWhenNeeded = true;

      # https://mpd.readthedocs.io/en/stable/user.html#configuration
      # https://mpd.readthedocs.io/en/stable/mpd.conf.5.html
      extraConfig = ''
        auto_update "yes"
        log_file "syslog"
        restore_paused "yes"

        audio_output {
          name "PipeWire"
          type "pipewire"
        }

        audio_output {
          type      "httpd"
          name      "My HTTP Stream"
          encoder   "opus"
          port      "8000"
          # quality   "5.0"     # do not define if bitrate is defined
          bitrate   "128000"      # do not define if quality is defined
          format    "48000:16:1"
          always_on "yes"     # prevent MPD from disconnecting all listeners when playback is stopped.
          tags      "yes"     # httpd supports sending tags to listening streams.
        }

        audio_output {
            type   "fifo"
            name   "Visualizer"
            path   "/tmp/mpd.fifo"
            # format "44100:16:2"
        }
      '';
    };

    mpdris2 = {
      # https://github.com/szclsya/mpdris2-rs
      enable = true;
      multimediaKeys = true;
      notifications = true;
    };
  };
}
