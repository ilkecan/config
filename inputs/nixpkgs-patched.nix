{
  inputs,
  patchInput,
}:

let
  inherit (inputs.nixpkgs.lib)
    mapAttrsToList
  ;

  pulls = {
    "480060" = "sha256-FNMYPEOeCp0WSbM9XZxJm8Qb9QfsTGud8cBriM6fnrM=";
    "494001" = "sha256-6dJgDCqmUx86kVgsqSXKSUF1v0GPvsA2hTKy/S7E2+I=";
  };

  mkPatch = number: sha256:
    let
      name = "${number}.patch";
    in
    { inherit name sha256; url = "https://github.com/NixOS/nixpkgs/pull/${name}?full_index=1"; };
  patches = mapAttrsToList mkPatch pulls;
in
patchInput patches inputs.nixpkgs-unstable "nixpkgs"
