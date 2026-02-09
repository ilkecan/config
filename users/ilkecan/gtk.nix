{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    attrVals
  ;

  toUri = protocol: path: "${protocol}://${path}";
  toFile = toUri "file";
  userDirs = [
    "desktop"
    "documents"
    "download"
    "music"
    "pictures"
    "publicShare"
    "templates"
    "videos"
  ];
in
{
  gtk = {
    enable = true;

    gtk2 = {
    };

    gtk3 = {
      bookmarks = map toFile (attrVals userDirs config.xdg.userDirs);
    };

    gtk4 = {
    };
  };
}
