{
  config,
  inputs,
  lib,
  pkgs,
  userConfig,
  ...
}:

let
  inherit (lib)
    importJSON
    mapAttrs
    mapAttrsToList
    toJSON
    ;

  inherit (lib._.ilkecan)
    importsFromDirectory
    resolveFlakeLockNodeName
    ;

  lock = importJSON "${inputs.self}/flake.lock";

  resolveNodeName = resolveFlakeLockNodeName lock;

  pins = mapAttrs (
    _: inputSpec: lock.nodes.${resolveNodeName inputSpec}.locked
  ) lock.nodes.${lock.root}.inputs;

  flakeRegistry = pkgs.writeText "flake-registry.json" (toJSON {
    version = 2;
    flakes = mapAttrsToList (id: to: {
      from = {
        type = "indirect";
        inherit id;
      };
      inherit to;
    }) pins;
  });
in
{
  imports = importsFromDirectory ./.;

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

      flake-registry = flakeRegistry;

      trusted-users = [ userConfig.home.username ];

      auto-optimise-store = true;
      http-connections = 128; # default: 25
      http3 = true;
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
