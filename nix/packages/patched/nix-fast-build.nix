{
  fetchpatch2,
  nix-fast-build,
}:

nix-fast-build.overrideAttrs (prev: {
  version = "${prev.version}-unstable-2026-03-11";
  src = prev.src.override {
    tag = null;
    rev = "f5ca03a4387aecd739d60c77ae26e567481c3013";
    hash = "sha256-mInYAyDT49w0ux7Jgg4Ny3igyEKlRvqzG2KAG9YVmsg=";
  };
  patches = (prev.patches or [ ]) ++ [
    (fetchpatch2 {
      name = "support-impure-derivations.patch";
      url = "https://github.com/Mic92/nix-fast-build/pull/301.diff?full_index=1";
      hash = "sha256-xVN5nOUIDTrCJ6jBeKp/MiYkHULYvj0xgBFqiQ34f+U=";
    })
  ];
})
