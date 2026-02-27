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

  patchInput = patches: input: name:
    let
      src = applyPatches {
        name = "${name}-patched";
        patches = map fetchpatch2 patches;
        src = input;
      };

      flake = import "${src}/flake.nix";
      outputs = flake.outputs ({ self = outputs; } // input.inputs);
      sourceInfo = input.sourceInfo // { inherit (src) outPath; };
    in
    outputs // sourceInfo // {
      _type = "flake";
      inherit (input) inputs;
      inherit sourceInfo outputs;
    };

  newAttrs = {
    nixpkgs-patched = import ./nixpkgs-patched.nix { inherit inputs patchInput; };
  };
in
inputs // newAttrs // { self = inputs.self // { inputs = inputs.self.inputs // newAttrs; }; }
