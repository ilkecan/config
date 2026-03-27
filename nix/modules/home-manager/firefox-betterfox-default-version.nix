{
  config,
  inputs',
  lib,
  ...
}:

let
  inherit (lib)
    attrNames
    elem
    elemAt
    length
    mkDefault
    versions
    ;

  cfg = config.programs.firefox;
  firefoxVersion = versions.majorMinor cfg.package.version;
  supportedVersions = attrNames (import "${inputs'.betterfox-nix}/data/firefox");
  version =
    if elem firefoxVersion supportedVersions then
      firefoxVersion
    else
      elemAt supportedVersions (length supportedVersions - 2); # zero-based numbering & `last` is "main"
in
{
  programs.firefox.betterfox.version = mkDefault version;
}
