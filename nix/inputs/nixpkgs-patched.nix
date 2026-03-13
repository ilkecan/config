{
  owner = "NixOS";
  repo = "nixpkgs";
  input = "nixpkgs-unstable";
  name = "nixpkgs-patched";
  pulls = [
    {
      number = "480060";
      hash = "sha256-FNMYPEOeCp0WSbM9XZxJm8Qb9QfsTGud8cBriM6fnrM=";
    } # various: use absolute path in thumbnailer files
  ];
}
