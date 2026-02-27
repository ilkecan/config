{
  inputs,
  system,
}:

import inputs.nixpkgs {
  localSystem = { inherit system; };

  config = {
    allowUnfree = true;
    permittedInsecurePackages = [
    ];
  };

  overlays = [
    (final: _prev: {
      unstable = import inputs.nixpkgs-unstable {
        localSystem = final.stdenv.hostPlatform;
        inherit (final) config;
      };
    })

    (final: _prev: {
      patched = import inputs.nixpkgs-patched {
        localSystem = final.stdenv.hostPlatform;
        inherit (final) config;
      };
    })

    # TODO: until `stable` nixpkgs is updated to v26.05
    # inputs.nur.overlays.default
    (final: _prev: {
      nur = (inputs.nur.overlays.default final.unstable final.unstable).nur;
    })

    inputs.nix-alien.overlays.default

    (final: _prev: {
      notashelf = {
        inherit (inputs.flint.packages.${final.stdenv.hostPlatform.system}) flint;
      };
    })
  ];
}
