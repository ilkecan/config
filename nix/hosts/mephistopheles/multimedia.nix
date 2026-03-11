{
  ...
}:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;

      lowLatency = {
        # https://github.com/fufexan/nix-gaming#pipewire-low-latency
        enable = true;
      };
    };
  };
}
