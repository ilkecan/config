{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    upterm  # https://github.com/owenthereal/upterm
  ];

  services.ssh-agent = {
    enable = true;
  };
}
