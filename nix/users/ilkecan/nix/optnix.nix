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

  mkFlakePartsScope = flake: {
    description = "flake-parts top level configuration";
    options-list-file = mkOptionsList {
      inherit (flake.debug) options;
      excluded = [ "perSystem" ];
    };
    evaluator = "nix eval ${flake}#debug.config.{{ .Option }}";
  };
  mkFlakePartsPerSystemScope = flake: system: {
    description = "flake-parts `perSystem` configuration for `${system}`";
    options-list-file = mkOptionsList { inherit (flake.allSystems.${system}.debug) options; };
    evaluator = "nix eval ${flake}#allSystems.${system}.debug.config.{{ .Option }}";
  };
  mkHomeManagerScope = flake: name: value: {
    description = "Home Manager configuration for `${name}`";
    options-list-file = mkOptionsList { inherit (value) options; };
    evaluator = "nix eval ${flake}#homeConfigurations.${name}.config.{{ .Option }}";
  };
  mkNixosScope = flake: name: value: {
    description = "NixOS configuration for `${name}`";
    options-list-file = mkOptionsList { inherit (value) options; };
    evaluator = "nix eval ${flake}#nixosConfigurations.${name}.config.{{ .Option }}";
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
          (mapAttrs (mkHomeManagerScope self') self'.homeConfigurations)
          (mapAttrs (mkNixosScope self') self'.nixosConfigurations)
        ];
      };
    };
  };
}
