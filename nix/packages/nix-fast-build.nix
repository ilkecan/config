{
  fetchpatch2,
  nix-fast-build,
}:

nix-fast-build.overrideAttrs (prev: {
  version = "${prev.version}-unstable-2026-03-08";
  src = prev.src.override {
    tag = null;
    rev = "dde85ca993e9709dce1932c679baa2436cd00127";
    hash = "sha256-ZPlRNdkgKBeo6J0S51JZRFBGq/tFfd7oVqAz2a9ytuM=";
  };
  patches = (prev.patches or []) ++ [
    (fetchpatch2 {
      name = "use-nix-build-subcommand.patch";
      url = "https://patch-diff.githubusercontent.com/raw/Mic92/nix-fast-build/pull/301.patch";
      hash = "sha256-p6QXVDnXIU+smSGfR0BBkAAaGHZoEEvkTRJXIoqEGZs=";
    })
  ];
})
