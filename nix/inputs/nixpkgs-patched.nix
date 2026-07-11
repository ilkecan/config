{
  owner = "NixOS";
  repo = "nixpkgs";
  input = "nixpkgs-unstable";
  name = "nixpkgs-patched";
  pulls = [
    {
      number = "480060";
      hash = "sha256-vM0D/VZlA/MkWem1d3EDUqaTEwGHxwwmq2U+VMSuyNc=";
    } # various: use absolute path in thumbnailer files
  ];
}
