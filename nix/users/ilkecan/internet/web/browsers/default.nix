{
  ...
}:

{
  imports = [
    ./chromium.nix
    ./firefox
    ./qutebrowser.nix
  ];

  home = {
    sessionVariables = {
      BROWSER = "firefox";
    };
  };
}
