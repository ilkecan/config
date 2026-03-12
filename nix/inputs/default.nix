{
  inputs,
}:

let
  # NOTE: unfortunately there is no way to avoid hard-coded `system` yet
  # https://github.com/NixOS/nix/issues/3920
  system = "x86_64-linux";
  inherit (inputs.nixpkgs.legacyPackages.${system})
    applyPatches
    fetchpatch2
    ;

  patchInput =
    {
      owner,
      repo,
      src,
      name,
      pulls,
      patches ? [ ],
    }:
    let
      mkPatch =
        { number, hash }:
        fetchpatch2 {
          inherit hash;
          name = "${owner}-${repo}-${number}.patch";
          url = "https://github.com/${owner}/${repo}/pull/${number}.patch?full_index=1";
        };
      patches' = patches ++ map mkPatch pulls;
      src' = applyPatches {
        inherit name src;
        patches = patches';
      };

      flake = import "${src'}/flake.nix";
      outputs = flake.outputs ({ inherit self; } // src.inputs);
      sourceInfo = src.sourceInfo // {
        inherit (src') outPath;
      };
      self =
        outputs
        // sourceInfo
        // {
          _type = "flake";
          inherit (src) inputs;
          inherit sourceInfo outputs;
        };
    in
    self;

  args = { inherit inputs; };
  newAttrs = {
    dms = patchInput (import ./dms.nix args);
    home-manager = patchInput (import ./home-manager.nix args);
    nixpkgs = patchInput (import ./nixpkgs.nix args);
    nixpkgs-patched = patchInput (import ./nixpkgs-patched.nix args);
  };
in
inputs
// newAttrs
// {
  self = inputs.self // {
    inputs = inputs.self.inputs // newAttrs;
  };
}
