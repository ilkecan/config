{
  inputs
}:

let
  system = "x86_64-linux";
  inherit (inputs.nixpkgs.legacyPackages.${system})
    applyPatches
    fetchpatch2
  ;

  patchInput = patches: input: name:
    let
      patchedInput = applyPatches {
        name = "${name}-patched";
        patches = map fetchpatch2 patches;
        src = input;
      };

      flake = import "${patchedInput}/flake.nix";
      self = flake.outputs inputs;
      inputs = { inherit self; } // input.inputs;
      sourceInfo = input.sourceInfo // { inherit (patchedInput) outPath; };
    in
    self // sourceInfo // {
      _type = "flake";
      inherit (input) inputs;
      inherit sourceInfo;
      outputs = self;
    };

  newAttrs = {
    nixpkgs-patched = import ./nixpkgs-patched.nix { inherit inputs patchInput; };
  };
in
inputs // newAttrs // { self = inputs.self // { inputs = inputs.self.inputs // newAttrs; }; }
