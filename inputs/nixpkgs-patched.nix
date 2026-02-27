{
  inputs,
}:

{
  owner = "NixOS";
  repo = "nixpkgs";
  src = inputs.nixpkgs-unstable;
  name = "nixpkgs-patched";
  pulls = {
    "480060" = "sha256-FNMYPEOeCp0WSbM9XZxJm8Qb9QfsTGud8cBriM6fnrM="; # various: use absolute path in thumbnailer files
    "494001" = "sha256-6dJgDCqmUx86kVgsqSXKSUF1v0GPvsA2hTKy/S7E2+I="; # nixos/envfs: fix compatibility with systemd in initrd
    "494635" = "sha256-40eAk/JQ5kK6V4Yq1qQWir91vBvhKK0LAWF5rJIMTuI="; # oscar: 1.7.0 -> 1.7.1
  };
}
