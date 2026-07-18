{
  inputs,
  lib,
  system,
}:

let
  inherit (lib)
    removeSuffix
    ;

  inherit (lib._.ilkecan)
    importTree
    ;

  localSystem = { inherit system; };
in
import inputs.nixpkgs {
  inherit localSystem;

  config = {
    allowUnfree = true;
    permittedInsecurePackages = [
    ];
  };

  overlays = [
    (final: _prev: {
      inherit (final.unstable)
        logitech-udev-rules
        solaar
        ;
    })

    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        inherit localSystem;
        inherit (final) config;
      };
    })

    (final: _prev: {
      patched = import inputs.nixpkgs-patched {
        inherit localSystem;
        inherit (final) config;
      };
    })

    inputs.nur.overlays.default
    inputs.llm-agents.overlays.shared-nixpkgs
    inputs.nix-alien.overlays.default

    (final: _prev: {
      notashelf = {
        inherit (inputs.flint.packages.${final.stdenv.hostPlatform.system}) flint;
      };

      inherit (inputs.nix-ast-lint.packages.${final.stdenv.hostPlatform.system}) nix-ast-lint;
    })

    (_final: prev: {
      patched =
        prev.patched
        // importTree {
          root = ./patched;
          depth = 1;
          importFn = x: prev.patched.callPackage x { };
          normalizeNameFn = removeSuffix ".nix";
        };
    })
  ];
}
