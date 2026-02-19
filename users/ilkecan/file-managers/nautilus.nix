{
  pkgs,
  ...
}:

let
  thumbnailers = with pkgs; [
    ffmpegthumbnailer   # https://github.com/dirkvdb/ffmpegthumbnailer
    gnome-epub-thumbnailer   # https://gitlab.gnome.org/GNOME/gnome-epub-thumbnailer
    libheif   # https://github.com/strukturag/libheif
    libheif.out   # https://github.com/NixOS/nixpkgs/pull/427112
    nufraw-thumbnailer
    papers  # https://gitlab.gnome.org/GNOME/papers
    unstable.bign-handheld-thumbnailer   # https://github.com/MateusRodCosta/bign-handheld-thumbnailer
    patched.gnome-font-viewer   # https://gitlab.gnome.org/GNOME/gnome-font-viewer
    patched.icoextract  # https://github.com/jlu5/icoextract
    patched.libgsf  # https://gitlab.gnome.org/GNOME/libgsf
    patched.sameboy   # https://github.com/LIJI32/SameBoy
    unstable.gnome-kra-ora-thumbnailer   # https://gitlab.gnome.org/GNOME/gnome-kra-ora-thumbnailer/
    xapp-thumbnailers   # https://github.com/linuxmint/xapp-thumbnailers
  ];
in
{
  home.packages = with pkgs; [
    nautilus
  ]
    ++ thumbnailers
  ;
}
