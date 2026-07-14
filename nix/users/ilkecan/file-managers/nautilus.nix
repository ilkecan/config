{
  pkgs,
  ...
}:

let
  thumbnailers = with pkgs; [
    bign-handheld-thumbnailer # https://github.com/MateusRodCosta/bign-handheld-thumbnailer
    ffmpegthumbnailer # https://github.com/dirkvdb/ffmpegthumbnailer
    gnome-epub-thumbnailer # https://gitlab.gnome.org/GNOME/gnome-epub-thumbnailer
    gnome-kra-ora-thumbnailer # https://gitlab.gnome.org/GNOME/gnome-kra-ora-thumbnailer/
    libheif # https://github.com/strukturag/libheif
    libheif.out # https://github.com/NixOS/nixpkgs/pull/427112
    nufraw-thumbnailer
    papers # https://gitlab.gnome.org/GNOME/papers
    unstable.gnome-font-viewer # https://gitlab.gnome.org/GNOME/gnome-font-viewer
    unstable.icoextract # https://github.com/jlu5/icoextract
    unstable.libgsf # https://gitlab.gnome.org/GNOME/libgsf
    unstable.sameboy # https://github.com/LIJI32/SameBoy
    xapp-thumbnailers # https://github.com/linuxmint/xapp-thumbnailers
  ];
in
{
  home.packages =
    with pkgs;
    [
      nautilus
    ]
    ++ thumbnailers;
}
