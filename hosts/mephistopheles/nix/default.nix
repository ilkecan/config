{
  config,
  homeConfig,
  lib,
  pkgs,
  ...
}:

let

  inherit (lib)
    imap1
    mkForce
  ;
in
{
  imports = [
    ./angrr.nix
    ./envfs.nix
    ./nix-ld.nix
  ];

  nix = {
    package = pkgs.nixVersions.stable;
    channel.enable = false;

    extraOptions = ''
      !include ${config.sops.templates.nix-access-tokens.path}
    '';

    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
        "no-url-literals"
      ];
      trusted-users = [ homeConfig.home.username ];

      substituters = mkForce (imap1 (i: x: "${x}?priority=${toString i}") [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"

        "https://cache.numtide.com"
        "https://nix-gaming.cachix.org"

        # NUR
        "https://ilkecan.cachix.org"
        "https://rycee.cachix.org"
      ]);

      trusted-public-keys = [
        "ilkecan.cachix.org-1:hXb7Vo9EzaXiEb0elvG6Tt5TrP3zrcadyoX8c+lbeCY="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "rycee.cachix.org-1:TiiXyeSk0iRlzlys4c7HiXLkP3idRf20oQ/roEUAh/A="
      ];

      auto-optimise-store = true;
      http-connections = 128;   # default: 25
      keep-going = true;
      keep-outputs = true;
      max-substitution-jobs = 128; # default: 16
      # warn-short-path-literals = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
