# Refactor Tentaflake for Flake-Input Composition

## Goal

Refactor tentaflake into a clean **NixOS module library** that's consumed as a flake input (Option A). No backward-compat baggage — this repo was created today.

## Design

```
Before:     params (specialArgs) → modules read params.*
After:      consumer sets tentaflake.* options → modules read config.tentaflake.*
```

Tentaflake exports:
- `nixosModules.default` — the reusable module set with `tentaflake.*` options
- `lib.<system>.mkHermesAgent` — agent creation helper
- `lib.<system>.constants` — default values

The built-in `nixosConfigurations.agent-host` sets `tentaflake.*` options inline and imports `self.nixosModules.default`. No bridge, no `params` specialArg.

---

## Tasks

### Task 1: Create `modules/options.nix`

Define `tentaflake.*` NixOS options. Defaults imported from `lib/constants.nix`.

```nix
{ lib, ... }:
let
  inherit (import ../lib/constants.nix) hostName adminUser adminDescription
    adminShell defaultLocale consoleKeyMap stateVersion;
in {
  options.tentaflake = {
    hostName = lib.mkOption {
      type = lib.types.str;
      default = hostName;
      description = "System hostname";
    };
    adminUser = lib.mkOption {
      type = lib.types.str;
      default = adminUser;
      description = "Primary admin username";
    };
    adminDescription = lib.mkOption {
      type = lib.types.str;
      default = adminDescription;
    };
    adminShell = lib.mkOption {
      type = lib.types.str;
      default = adminShell;
    };
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "UTC";
    };
    defaultLocale = lib.mkOption {
      type = lib.types.str;
      default = defaultLocale;
    };
    consoleKeyMap = lib.mkOption {
      type = lib.types.str;
      default = consoleKeyMap;
    };
    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = stateVersion;
    };
  };
}
```

→ Verify: file exists, syntactically valid

### Task 2: Add `options.nix` to `modules/default.nix`

Prepend `./options.nix` to the import list.

→ Verify: `nix flake check` passes

### Task 3: Convert all modules from `params.*` → `config.tentaflake.*`

7 modules + configuration.nix:

| File | Change |
|------|--------|
| `modules/locale.nix` | Remove `params` arg. Read `config.tentaflake.timeZone / defaultLocale / consoleKeyMap` |
| `modules/networking.nix` | Remove `params` arg. Read `config.tentaflake.hostName` |
| `modules/tailscale.nix` | Remove `params` arg. Read `config.tentaflake.hostName` |
| `modules/users.nix` | Remove `params` arg. Read `config.tentaflake.adminUser / adminDescription / adminShell` |
| `modules/nix-settings.nix` | Remove `params` arg. Read `config.tentaflake.adminUser` |
| `modules/boot.nix` | Remove unused `params` arg |
| `modules/desktop/niri-noctalia.nix` | Remove `params` arg. Read `config.tentaflake.adminUser` |
| `configuration.nix` | Remove `params` arg. Read `config.tentaflake.adminUser / stateVersion` |

Each module changes from:
```nix
{ params, ... }: { ... params.adminUser ... }
```
to:
```nix
{ config, lib, pkgs, ... }:
let cfg = config.tentaflake;
in { ... cfg.adminUser ... }
```

→ Verify: `nix flake check` passes after each file

### Task 4: Update `configuration.nix` — slim to host-specific wiring

Remove module imports (handled by `nixosModules.default`). Only keep Docker + agents + stateVersion:

```nix
{ config, lib, pkgs, ... }:
let
  cfg = config.tentaflake;
  myAgents = [ ];
in {
  imports = myAgents;

  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
  users.users.${cfg.adminUser}.extraGroups = [ "docker" ];
  system.stateVersion = cfg.stateVersion;
}
```

→ Verify: `nix flake check` passes

### Task 5: Simplify `flake.nix`

Remove `params` from `specialArgs`. Set `tentaflake.*` options directly in built-in host module lists.

```nix
{
  description = "Generic NixOS flake template for running multiple isolated Hermes agents on one headless machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Optional inputs stay commented out
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
    repoRoot = ./.;
    constants = import ./lib/constants.nix;
    mkHermesAgent = (import ./lib { inherit pkgs lib; }).mkHermesAgent;

    tentaflakeModules = import ./modules/default.nix;

    # Shared specialArgs — no params, just helpers
    baseSpecialArgs = {
      inherit inputs self mkHermesAgent repoRoot constants;
    };
  in {
    # ── Exported module set ──
    nixosModules.default = tentaflakeModules;

    # ── Exported helpers ──
    lib.${system} = { inherit mkHermesAgent constants; };

    # ── Formatter ──
    formatter.${system} = pkgs.nixfmt;

    # ── Example host (consumes self via nixosModules) ──
    nixosConfigurations.agent-host = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = baseSpecialArgs // { isLiveISO = false; };
      modules = [
        # Configure tentaflake options directly — no params specialArg
        {
          tentaflake.hostName = "agent-host";
          tentaflake.adminUser = "admin";
          tentaflake.adminDescription = "System Administrator";
          tentaflake.adminShell = "${pkgs.bash}/bin/bash";
          tentaflake.timeZone = "UTC";
          tentaflake.defaultLocale = constants.defaultLocale;
          tentaflake.consoleKeyMap = constants.consoleKeyMap;
          tentaflake.stateVersion = constants.stateVersion;
        }
        self.nixosModules.default
        ./configuration.nix
      ];
    };

    # ── Installer ISO (standalone, doesn't need tentaflake modules) ──
    nixosConfigurations.installer-iso = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = baseSpecialArgs // { isLiveISO = false; };
      modules = [ ./installer/iso.nix ];
    };

    # ── Live agent ISO ──
    nixosConfigurations.live-agent = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = baseSpecialArgs // { isLiveISO = true; };
      modules = [
        {
          tentaflake.hostName = "live-agent";
          tentaflake.adminUser = "admin";
          tentaflake.adminDescription = "System Administrator";
          tentaflake.adminShell = "/run/current-system/sw/bin/bash";
          tentaflake.timeZone = "UTC";
          tentaflake.defaultLocale = constants.defaultLocale;
          tentaflake.consoleKeyMap = constants.consoleKeyMap;
          tentaflake.stateVersion = constants.stateVersion;
        }
        self.nixosModules.default
        ./configuration.nix
        ./installer/live-iso.nix
      ];
    };

    # ── Convenience packages ──
    packages.${system} = {
      installer-iso = self.nixosConfigurations.installer-iso.config.system.build.isoImage;
      live-agent-iso = self.nixosConfigurations.live-agent.config.system.build.isoImage;
      piper-voices = pkgs.callPackage ./pkgs/piper-voices { };
    };
  };
}
```

→ Verify: `nix flake check` passes, all 3 hosts build

### Task 6: Update `installer/live-iso.nix` — remove redundant imports

`live-iso.nix` currently does `imports = [ ../configuration.nix ... ]`. Since `flake.nix` now provides `configuration.nix` in the module list alongside `live-iso.nix`, remove it from `live-iso.nix` to avoid double-import:

```nix
imports = [
  "${modulesPath}/installer/cd-dvd/iso-image.nix"
  ./live-profile.nix
];
```

→ Verify: `nix build .#live-agent-iso` succeeds

### Task 7: Update `.gitignore`

Add `home.nix` — personal HM configs should never go in the template.

→ Verify: file edited

### Task 8: Add `nix flake check` to CI if missing

Check `.github/workflows/` — ensure `nix flake check` runs on push/PR.

→ Verify: CI triggers on next push

### Task 9: Update README

Two core changes:
1. Remove `params` from all code examples — use `tentaflake.*` options instead
2. Add a "Usage as Flake Input" section showing the clean pattern:

```nix
# your-flake.nix
{
  inputs.tentaflake.url = "github:timfewi/tentaflake";

  outputs = { self, nixpkgs, tentaflake, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    mkHermesAgent = tentaflake.lib.${system}.mkHermesAgent;
  in {
    nixosConfigurations.my-host = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit mkHermesAgent; };
      modules = [
        tentaflake.nixosModules.default
        {
          tentaflake.hostName = "my-machine";
          tentaflake.adminUser = "alice";
          tentaflake.timeZone = "Europe/Vienna";
        }
        ./hardware-configuration.nix
        ./my-agents.nix
      ];
    };
  };
}
```

Also update the "Quick Start" section to reflect the new pattern.

→ Verify: README is accurate and consistent

### Task 10: Create `examples/consumer-flake.nix`

A complete example showing an external private repo using tentaflake as input with HM + agenix + custom agents.

→ Verify: file exists, syntactically valid

---

## Files Changed

| File | Change |
|------|--------|
| `modules/options.nix` | **New** — tentaflake.* option definitions |
| `modules/default.nix` | Edit — add options.nix |
| `modules/locale.nix` | Edit — params → config.tentaflake.* |
| `modules/networking.nix` | Edit — params → config.tentaflake.* |
| `modules/tailscale.nix` | Edit — params → config.tentaflake.* |
| `modules/users.nix` | Edit — params → config.tentaflake.* |
| `modules/nix-settings.nix` | Edit — params → config.tentaflake.* |
| `modules/boot.nix` | Edit — remove unused params |
| `modules/desktop/niri-noctalia.nix` | Edit — params → config.tentaflake.* |
| `configuration.nix` | Edit — remove module imports, params → config.tentaflake.* |
| `flake.nix` | Edit — remove params specialArg, add nixosModules + lib, set tentaflake.* inline |
| `installer/live-iso.nix` | Edit — remove `../configuration.nix` import |
| `.gitignore` | Edit — add home.nix |
| `README.md` | Edit — update for new pattern |
| `examples/consumer-flake.nix` | **New** |

## Done When

- [ ] `nix flake check` passes
- [ ] `nix build .#nixosConfigurations.agent-host.config.system.build.toplevel` succeeds
- [ ] `nix build .#installer-iso` succeeds
- [ ] `nix build .#live-agent-iso` succeeds
- [ ] `nix build .#piper-voices` succeeds
- [ ] External consumer can use `inputs.tentaflake.nixosModules.default`
- [ ] External consumer can use `inputs.tentaflake.lib.x86_64-linux.mkHermesAgent`
- [ ] No `params` specialArg references remain anywhere in repo
- [ ] README documents flake-input pattern
- [ ] `examples/consumer-flake.nix` exists
