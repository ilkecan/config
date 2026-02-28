{
  inputs
}:

let
  # NOTE: unfortunately there is no way to avoid hard-coded `system` yet
  # https://github.com/NixOS/nix/issues/3920
  system = "x86_64-linux";
  inherit (inputs.nixpkgs.legacyPackages.${system})
    applyPatches
    fetchpatch2
  ;

  inherit (inputs.nixpkgs.lib)
    mapAttrsToList
  ;

  patchInput = { owner, repo, src, name, pulls }:
    let
      mkPatch = number: sha256:
        {
          inherit sha256;
          name = "${owner}-${repo}-${number}.patch";
          url = "https://github.com/${owner}/${repo}/pull/${number}.patch?full_index=1";
        };
      patches = map fetchpatch2 (mapAttrsToList mkPatch pulls);
      src' = applyPatches { inherit name src patches; };
      flake = import "${src'}/flake.nix";
      outputs = flake.outputs ({ self = outputs; } // src.inputs);
      sourceInfo = src.sourceInfo // { inherit (src') outPath; };
    in
    outputs // sourceInfo // {
      _type = "flake";
      inherit (src) inputs;
      inherit sourceInfo outputs;
    };

  args = { inherit inputs; };
  newAttrs = {
    dms = patchInput (import ./dms.nix args);
    home-manager = patchInput (import ./home-manager.nix args);
    nixpkgs-patched = patchInput (import ./nixpkgs-patched.nix args);
  };
in
inputs // newAttrs // { self = inputs.self // { inputs = inputs.self.inputs // newAttrs; }; }
