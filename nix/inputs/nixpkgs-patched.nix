{
  owner = "NixOS";
  repo = "nixpkgs";
  input = "nixpkgs-unstable";
  name = "nixpkgs-patched";
  pulls = [
    {
      number = "563205";
      hash = "sha256-pnUFzmfypRdcQpzm8yYIdKFI7hcsEY9RlJLp9BYLawY=";
    } # libghostty-vt: 0.1.0-unstable-2026-07-20 -> 0.1.0-unstable-2026-08-06
  ];
}
