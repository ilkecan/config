{
  fetchpatch2,
  nix-fast-build,
}:

nix-fast-build.overrideAttrs (
  _final: prev: {
    version = "1.4.0-unstable-2026-03-19";
    src = prev.src.override {
      tag = "1.4.0";
      hash = "sha256-sH/KWX8NO8iurnnkI7w8eWMkbnRBbvEIK9IW4LnR0qQ=";
    };
    patches = (prev.patches or [ ]) ++ [
      (fetchpatch2 {
        name = "guard-against-empty-outputs.patch";
        url = "https://github.com/Mic92/nix-fast-build/pull/309.diff?full_index=1";
        hash = "sha256-e+2AowxVyx2FbGxgZRND0PsR5gdLGXSAVTN9Ur0Ew4Y=";
      })
    ];
  }
)
