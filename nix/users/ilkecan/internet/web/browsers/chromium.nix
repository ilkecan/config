{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (builtins)
    fetchurl
  ;

  inherit (lib)
    versions
  ;

  browserVersion = versions.major config.programs.chromium.package.version;
  createChromiumExtension = { id, sha256, version }:
    {
      inherit id;
      crxPath = fetchurl {
        url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
        name = "${id}.crx";
        inherit sha256;
      };
      inherit version;
    };
in

{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;

    commandLineArgs = [
      "--enable-features=AcceleratedVideoEncoder"
      "--enable-zero-copy"
      "--ignore-gpu-blocklist"
    ];

    dictionaries = with pkgs; [
      hunspellDictsChromium.en_US
    ];

    extensions = [
      (createChromiumExtension {
        # ublock origin
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        sha256 = "sha256:0pba857r9n2hlfc6szxicf69yqg6kqyz74cz13k4alacjrdkk2n3";
        version = "1.68.0";
      })
      (createChromiumExtension {
        # dark reader
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
        sha256 = "sha256:0hijj2gd34qqspxx9y7kjdya5q9kdjl4lajc6mgh7jysziw0c838";
        version = "4.9.118";
      })
    ];
  };
}
