{
  inputs,
  lib,
  ...
}:

let
  inherit (lib)
    mapAttrsToList
  ;

  pulls = {
    "480060" = "sha256-FNMYPEOeCp0WSbM9XZxJm8Qb9QfsTGud8cBriM6fnrM=";
  };

  pullToPatch = number: sha256:
    let
      name = "${number}.patch";
    in
    { inherit name sha256; url = "https://github.com/NixOS/nixpkgs/pull/${name}?full_index=1"; };
  patches = mapAttrsToList pullToPatch pulls;
in
{
  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      localSystem = { inherit system; };

      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
        ];
      };

      overlays = [
        inputs.nix-alien.overlays.default
        # TODO: until `stable` nixpkgs is updated to v26.05
        # inputs.nur.overlays.default
        (final: _prev: {
          nur = (inputs.nur.overlays.default final.unstable final.unstable).nur;
        })

        (final: _prev: {
          unstable = import inputs.nixpkgs-unstable {
            localSystem = final.stdenv.hostPlatform;
            inherit (final) config;
          };
        })

        (final: _prev: {
          patched =
            let
              nixpkgs-patched = final.applyPatches {
                name = "nixpkgs-patched";
                src = inputs.nixpkgs-unstable;
                patches = map final.fetchpatch2 patches;
              };
            in
            import nixpkgs-patched {
              localSystem = final.stdenv.hostPlatform;
              inherit (final) config;
            };
        })

        (final: _prev: {
          notashelf = {
            inherit (inputs.flint.packages.${final.stdenv.hostPlatform.system}) flint;
          };
        })
      ];
    };
  };
}
