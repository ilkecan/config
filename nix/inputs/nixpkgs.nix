{
  owner = "NixOS";
  repo = "nixpkgs";
  name = "nixpkgs";
  pulls = [
    {
      number = "470359";
      hash = "sha256-33Vr0X+xhWjbkQhPCivRC8C9yQS1U6vct9U0H4Rtvxo=";
    } # nixos/automatic-timezoned: Fix boot delays and systemd unit ordering
    {
      number = "494001";
      hash = "sha256-JC391f0TQigESqOw+ubLwLmlnQuIRwPqHKg8BG+Oiwc=";
    } # nixos/envfs: fix compatibility with systemd in initrd
  ];
}
