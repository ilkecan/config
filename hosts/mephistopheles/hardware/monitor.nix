{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ddcui
    ddcutil
  ];
}
