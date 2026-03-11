{
  inputs',
  lib,
  pkgs,
  self',
  ...
}:

let
  inherit (lib)
    genAttrs'
    mapAttrs
    mergeAttrsList
    nameValuePair
    ;

  inherit (inputs'.optnix.mkLib pkgs) mkOptionsList;

  mkFlakePartsScope = self': {
    description = "flake-parts top level configuration";
    options-list-file = mkOptionsList {
      inherit (self'.debug) options;
      excluded = [ "perSystem" ];
    };
    evaluator = "nix eval ${self'}#debug.config.{{ .Option }}";
  };
  mkFlakePartsPerSystemScope = self': system: {
    description = "flake-parts `perSystem` configuration for `${system}`";
    options-list-file = mkOptionsList { inherit (self'.allSystems.${system}.debug) options; };
    evaluator = "nix eval ${self'}#allSystems.${system}.debug.config.{{ .Option }}";
  };
  mkHomeManagerScope = name: value: {
    description = "Home Manager configuration for `${name}`";
    options-list-file = mkOptionsList { inherit (value) options; };
    evaluator = "nix eval ${self'}#homeConfigurations.${name}.config.{{ .Option }}";
  };
  mkNixosScope = name: value: {
    description = "NixOS configuration for `${name}`";
    options-list-file = mkOptionsList { inherit (value) options; };
    evaluator = "nix eval ${self'}#nixosConfigurations.${name}.config.{{ .Option }}";
  };
in
{
  programs = {
    optnix = {
      enable = true;
      package = pkgs.unstable.optnix;

      settings = {
        min_score = 3;

        scopes = {
          "flake-parts" = mkFlakePartsScope self';
        }
        // mergeAttrsList [
          (genAttrs' self'.debug.systems (
            x: nameValuePair "flake-parts.${x}" (mkFlakePartsPerSystemScope self' x)
          ))
          (mapAttrs mkHomeManagerScope self'.homeConfigurations)
          (mapAttrs mkNixosScope self'.nixosConfigurations)
        ];
      };
    };
  };
}
