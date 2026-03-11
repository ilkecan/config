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
  xdg.systemDirs.data =
    let
      pkg = pkgs.gtk3;
    in
    [ "${pkg}/share/gsettings-schemas/${pkg.name}" ];

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
