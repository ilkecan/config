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
  patches = (prev.patches or []) ++ [
    (fetchpatch2 {
      name = "support-impure-derivations.patch";
      url = "https://patch-diff.githubusercontent.com/raw/Mic92/nix-fast-build/pull/301.patch";
      hash = "sha256-E2nffS/w3IRgr5r2VB/m5HgZkzDO4Ukn9f8n9gzkI8g=";
    })
  ];
})
