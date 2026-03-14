{
  applyPatches,
  automatic-timezoned,
  fetchpatch2,
  lib,
}:

let
  inherit (lib)
    mapAttrsToList
    ;

  patches = {
    "600" = "sha256-b6WJmnasro3f8GRE5XqFfLxKMuTgs1lxWSDH6CP7L7A=";
  };

  mkPatch =
    number: hash:
    fetchpatch2 {
      name = "${number}.patch";
      url = "https://github.com/maxbrunet/automatic-timezoned/pull/${number}.diff?full_index=1";
      inherit hash;
    };
in
automatic-timezoned.overrideAttrs (
  final: prev: {
    version = "${prev.version}-unstable-2026-03-11";
    dontVersionCheck = true;

    src = applyPatches {
      name = final.pname;
      src = prev.src.override {
        tag = null;
        rev = "2627ec2dcd85bbb640d40c735793e8ca3f99d18a";
        sha256 = "sha256-TH2I/cTSBDQzBvz4OCFxcbKf/aHqtFUsdJ/PQIvF0v0=";
      };

      patches = mapAttrsToList mkPatch patches;
    };

    cargoDeps = prev.cargoDeps.overrideAttrs (prev: {
      vendorStaging = prev.vendorStaging.overrideAttrs {
        inherit (final) src;
        outputHash = "sha256-SKbZTwAcni0060gDypSclOAU0oP3txe8Jkkttyo0Y/Q=";
      };
    });
  }
)
