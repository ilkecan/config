{
  config,
  ...
}:

let
  inherit (config.home)
    homeDirectory
    ;

  githubDir = "${homeDirectory}/repos/git/github.com";
in
{
  programs.niri.settings.spawn-at-startup = [
    {
      argv = [
        "alacritty"
        "--class"
        "alacritty-config"
        "--working-directory"
        "${githubDir}/ilkecan/config"
      ];
    }
    {
      argv = [
        "alacritty"
        "--class"
        "alacritty-nixpkgs"
        "--working-directory"
        "${githubDir}/NixOS/nixpkgs"
      ];
    }
    {
      argv = [
        "alacritty"
        "--class"
        "alacritty-review"
        "--working-directory"
        "${githubDir}/NixOS/nixpkgs/review"
      ];
    }
    { argv = [ "firefox" ]; }
    { argv = [ "io.gitlab.news_flash.NewsFlash" ]; }
    {
      argv = [
        "solaar"
        "--window=hide"
      ];
    }
    {
      argv = [
        "steam"
        "-silent"
      ];
    }
    { argv = [ "thunderbird" ]; }
    { argv = [ "wasistlos" ]; }
  ];
}
