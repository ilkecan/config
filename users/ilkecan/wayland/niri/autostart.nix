{
  config,
  ...
}:

let
  inherit (config.home)
    homeDirectory
  ;
in
{
  programs.niri.settings.spawn-at-startup = [
    { argv = [ "alacritty" "--class" "alacritty-config" "--working-directory" "${homeDirectory}/repos/git/github.com/ilkecan/config" "--command" "zellij --layout .zellij-layout.kdl" ]; }
    { argv = [ "alacritty" "--class" "alacritty-nixpkgs" "--working-directory" "${homeDirectory}/repos/git/github.com/NixOS/nixpkgs" "--command" "zellij --layout .zellij-layout.kdl" ]; }
    { argv = [ "alacritty" "--class" "alacritty-review" "--working-directory" "${homeDirectory}/repos/git/github.com/NixOS/nixpkgs/review" "--command" "zellij --layout .zellij-layout.kdl" ]; }
    { argv = [ "firefox" ]; }
    { argv = [ "io.gitlab.news_flash.NewsFlash" ]; }
    { argv = [ "solaar" "--window=hide" ]; }
    { argv = [ "steam" ]; }
    { argv = [ "wasistlos" ]; }
  ];
}
