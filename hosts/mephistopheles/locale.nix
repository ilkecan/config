{
  inputs,
  lib,
  ...
}:

let
  inherit (lib)
    mkDefault
  ;
in
{
  # TODO: until v26.05
  disabledModules = [ "services/system/automatic-timezoned.nix" ];
  imports = [
    "${inputs.nixpkgs-unstable}/nixos/modules/services/system/automatic-timezoned.nix"
  ];

  location.provider = "geoclue2";

  services = {
    automatic-timezoned = {
      enable = true;
    };

    geoclue2 = {
      enable = true;
    };
  };

  time.timeZone = mkDefault "Europe/Istanbul";
}
