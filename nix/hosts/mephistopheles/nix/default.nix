{
  config,
  lib,
  pkgs,
  userConfig,
  ...
}:

let
  inherit (lib.my)
    collectImports
    ;
in
{
  imports = collectImports ./.;

  nix = {
    package = pkgs.unstable.nixVersions.latest;
    channel.enable = false;

    extraOptions = ''
      !include ${config.sops.templates.nix-access-tokens.path}
    '';

    settings = {
      experimental-features = [
        "ca-derivations"
        "flakes"
        "impure-derivations"
        "nix-command"
      ];
      trusted-users = [ userConfig.home.username ];

      auto-optimise-store = true;
      http-connections = 128; # default: 25
      keep-going = true;
      keep-outputs = true;
      # lint-absolute-path-literals = "warn";
      # lint-short-path-literals = "warn";
      lint-url-literals = "fatal";
      max-substitution-jobs = 128; # default: 16
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
