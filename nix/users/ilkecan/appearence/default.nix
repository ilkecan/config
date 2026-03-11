{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./fonts.nix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    targets.firefox.profileNames = [ config.home.username ];
  };
}
