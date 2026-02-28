{
  inputs,
}:

{
  owner = "NixOS";
  repo = "nixpkgs";
  src = inputs.nixpkgs;
  name = "nixpkgs";
  pulls = {
    "470359" = "sha256-33Vr0X+xhWjbkQhPCivRC8C9yQS1U6vct9U0H4Rtvxo="; # nixos/automatic-timezoned: Fix boot delays and systemd unit ordering
    "494001" = "sha256-6dJgDCqmUx86kVgsqSXKSUF1v0GPvsA2hTKy/S7E2+I="; # nixos/envfs: fix compatibility with systemd in initrd
  };
}
