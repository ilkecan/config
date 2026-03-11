{
  pkgs,
  ...
}:

{
  boot = {
    consoleLogLevel = 0;
    kernelParams = [ "quiet" ];
    loader.timeout = 0;

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = with pkgs; [
        nixos-bgrt-plymouth
      ];
    };
  };
}
