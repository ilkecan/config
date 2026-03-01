# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A NixOS + Home Manager configuration flake for one host (`mephistopheles`, a Lenovo ThinkPad E14 Gen7 Intel) and one user (`ilkecan`). Built with `flake-parts`.

## Common Commands

`nh` is configured with the flake path and used for all build/switch operations. The zellij layout (`.zellij-layout.kdl`) has dedicated panes for these:

```bash
nh os switch        # Rebuild and activate NixOS configuration
nh os repl          # NixOS config REPL
nh home switch      # Rebuild and activate Home Manager configuration
nh home repl        # Home Manager config REPL
```

The raw `nix` CLI is used for flake-level operations:

```bash
nix flake update [input]   # Update flake inputs
nix flake metadata         # Show input metadata
nix flake check            # Check for evaluation errors
```

## Repository Structure

```
flake.nix              # Entry point: delegates to flake-parts via ./flake
flake/                 # Flake-parts modules defining all outputs
  args/                # Generic flake-parts module dir for injecting custom args
                       # (currently only perSystem args, but not limited to that)
  nixos-configurations.nix
  home-configurations.nix
  modules.nix
inputs/                # Applies patches to flake inputs
  default.nix          # Merges patched inputs over raw inputs
  nixpkgs.nix          # nixpkgs patches (module-level changes)
  nixpkgs-patched.nix  # nixpkgs-unstable patches (package-level changes)
  home-manager.nix     # home-manager patches
  dms.nix              # dms patches
lib/                   # Custom lib extensions (lib.my.*)
  my.nix               # lib.my.importTree, lib.my.mkAbsolute
  my-pkgs.nix          # lib.my-pkgs.callExpression
hosts/mephistopheles/  # NixOS host configuration
users/ilkecan/         # Home Manager user configuration
modules/               # Reusable NixOS/HM/flake modules
packages/              # Custom pkgs instantiation (overlays applied here)
secrets/               # sops-nix encrypted secrets
```

## Key Architectural Patterns

### Three nixpkgs Inputs

There are three nixpkgs inputs with distinct purposes:

- **`nixpkgs`** (stable, `nixos-25.11`) — base system. Patched in-place (overwrites itself in `inputs`) with **module-level** changes only (no package rebuilds).
- **`nixpkgs-unstable`** — always the original unpatched unstable channel. Exposed as `pkgs.unstable` overlay for select tools that need newer versions.
- **`nixpkgs-patched`** — patched version of `nixpkgs-unstable`, stored as a separate input. Used for **package-level** changes to contain cascade rebuilds: patching a package in `nixpkgs-unstable` directly could trigger rebuilds for all dependents; isolating it in a named input limits the blast radius to what explicitly uses `pkgs.patched`.

### Input Patching
`inputs/default.nix` applies upstream PRs to inputs and makes patched versions transparent by overwriting the originals under `inputs.*` (except `nixpkgs-patched`, which is always a separate input). Modules consume patched inputs the same way as stock ones.

### Custom pkgs Overlays
`packages/default.nix` instantiates nixpkgs with several overlays, making these package sets available everywhere:
- `pkgs.unstable` — nixos-unstable packages
- `pkgs.patched` — nixpkgs-unstable with package-level patches applied
- `pkgs.nur` — NUR packages
- `pkgs.notashelf` — packages from the flint flake
- `pkgs.llm-agents.*` — LLM agent tools

### lib.my.importTree
Used extensively to auto-import directories. If a directory has a `default.nix`, that file is imported; otherwise all `.nix` files and subdirectories are imported recursively. Avoids manual `imports = [...]` lists for leaf modules.

### Impermanence
The host uses `impermanence` (ephemeral `/` via btrfs). Persistent paths must be explicitly declared in `hosts/mephistopheles/impermanence.nix`.

### Secrets
Managed with `sops-nix`. Encrypted secrets live in `secrets/`.

### Key Inputs
- **nvf** — Neovim configuration framework (used for all neovim config under `users/ilkecan/text-editors/neovim/`)
- **stylix** — System-wide theming
- **niri-flake** — Niri Wayland compositor
- **disko** — Declarative disk partitioning
- **impermanence** — Ephemeral root filesystem support
- **sops-nix** — Secrets management (encrypted secrets in `secrets/`)
- **dms** — DankMaterialShell, a desktop shell for Wayland compositors, built with Quickshell
- **betterfox-nix** — Firefox user.js optimization

### specialArgs / extraSpecialArgs
- NixOS modules receive: `inputs'`, `lib` (extended), `self'`, `homeConfig` (the HM config)
- HM modules receive: `inputs'`, `self'`, `osConfig` (the NixOS config)
