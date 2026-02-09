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
    "480060" = "sha256-eGTcHObgSfYz5Gt92g0nS9MgljVv6vshwbz28DWwpTI=";
    "480164" = "sha256-mR9SOmQWeEBld2H1hopn7geXAnYwDwtJdBuBJcach44=";
    "485661" = "sha256-oMDlKMxsrDuqsjdbuVpFH4ij6/M7fPWU/tr0DOIM9pg=";
    "485963" = "sha256-DzvdCYfsXTtgwjibuONwSZsGYoC6R/vPPe/ekx/XndM=";
  };

  patches = mapAttrsToList (k: v: { url = "https://github.com/NixOS/nixpkgs/pull/${k}.patch?full_index=1"; sha256 = v; }) pulls;
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
