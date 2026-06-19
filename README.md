# nixos-agent-orchestration

**Generic, forkable NixOS flake template for running multiple isolated Hermes agents on one headless machine.**

Each agent runs in its own Docker container with separate state directory, system user, API key, and configuration. Agents cannot read each other's context.

## Architecture

```
┌─────────────────────────────────────────────────┐
│                   NixOS Host                     │
│                                                   │
│  ┌─────────────┐  ┌─────────────┐                │
│  │ Docker       │  │ Docker       │                │
│  │ hermes-coding│  │ hermes-     │     ...         │
│  │              │  │ research    │                │
│  │ user:        │  │ user:       │                │
│  │ hermes-coding│  │ hermes-     │                │
│  │ state:       │  │ research    │                │
│  │ /var/lib/    │  │ state:      │                │
│  │ hermes-coding│  │ /var/lib/   │                │
│  │              │  │ hermes-     │                │
│  │ key: sk-...  │  │ research    │                │
│  │              │  │             │                │
│  └─────────────┘  └─────────────┘                │
└─────────────────────────────────────────────────┘
```

## Quick Start

### 1. Fork this flake

```bash
git clone https://github.com/your-org/nixos-agent-orchestration
cd nixos-agent-orchestration
```

### 2. Customize parameters in `flake.nix`

Edit the `params` block:

```nix
params = {
  hostName = "my-agent-box";
  adminUser = "alice";
  adminDescription = "Alice the Admin";
  timeZone = "America/New_York";
  # ...
};
```

### 3. Define your agents

Create `my-agents.nix`:

```nix
{ mkHermesAgent }:
[
  (mkHermesAgent {
    name    = "coding";
    envFile = "/run/secrets/hermes-coding.env";
  })
]
```

### 4. Set up secrets

```bash
sudo mkdir -p /run/secrets
sudo cp secrets/hermes.env.example /run/secrets/hermes-coding.env
sudo chmod 600 /run/secrets/hermes-coding.env
sudo vi /run/secrets/hermes-coding.env
```

### 5. Rebuild

```bash
nix flake check
sudo nixos-rebuild switch --flake .#agent-host
```

## Agent Configuration Reference

### `mkHermesAgent` options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `name` | `string` | *(required)* | Agent identifier. Used for user, group, container name, state dir. |
| `stateDir` | `string` | `/var/lib/hermes-<name>` | Isolated state directory for this agent. |
| `user` | `string` | `hermes-<name>` | System user name. |
| `group` | `string` | `hermes-<name>` | System group name. |
| `uid` | `int` | `null` | Fixed UID (auto-assigned if null). |
| `image` | `string` | `ghcr.io/nousresearch/hermes-agent:latest` | OCI container image. |
| `envFile` | `path` | `null` | Path to `.env` file mounted into container. |
| `agenixFile` | `path` | `null` | Path to agenix secret (alternative to envFile). |
| `extraVolumes` | `list of string` | `[]` | Extra `host:container:mode` volume mounts. |
| `extraEnvironment` | `attrset` | `{}` | Extra environment variables for container. |
| `cmd` | `list of string` | `["gateway" "run" "--replace"]` | Container entrypoint override. |
| `autoStart` | `bool` | `true` | Start container with system. |
| `createUser` | `bool` | `true` | Create system user and group. |
| `extraContainerConfig` | `attrset` | `{}` | Extra OCI container options (merged deep). |

## Modules

All modules in `modules/` consume parameters from `flake.nix`'s `params` attrset:

| Module | Key settings |
|--------|-------------|
| `boot.nix` | systemd-boot, EFI variables |
| `locale.nix` | timezone, locale, keymap |
| `networking.nix` | hostname, nftables, firewall |
| `users.nix` | admin user with wheel + networkmanager |
| `nix-settings.nix` | flakes, GC, trusted-users |
| `packages.nix` | minimal CLI tools (curl, git, jq, tmux, vim) |
| `hardening.nix` | sysctl, AppArmor, journald limits |
| `tailscale.nix` | Tailscale with tag:agent + SSH (optional) |

## Secret Management

Two patterns supported:

### 1. `.env` file (simpler — recommended)

```nix
mkHermesAgent {
  name    = "coding";
  envFile = "/run/secrets/hermes-coding.env";
}
```

The file is mounted into the container at runtime. Contents:

```bash
OPENROUTER_API_KEY=sk-or-...
TELEGRAM_BOT_TOKEN=...
```

### 2. Agenix (for encrypted-in-repo secrets)

```nix
mkHermesAgent {
  name        = "coding";
  agenixFile  = "/run/agenix/hermes-key";
}
```

Configure agenix paths in your `configuration.nix` following [agenix documentation](https://github.com/ryantm/agenix).

Both patterns keep secrets off the Nix store and never in Nix evaluation.

## Commands

```bash
# Check flake validity
nix flake check

# Dry-run activation
sudo nixos-rebuild dry-activate --flake .#agent-host

# Build and switch
sudo nixos-rebuild switch --flake .#agent-host

# Rollback
sudo nixos-rebuild switch --rollback

# List containers
docker ps --filter "name=hermes-"

# View agent logs
docker logs hermes-coding
```

## Adding More Agents

1. Add a block to `my-agents.nix` using `mkHermesAgent`
2. Create the corresponding `.env` file in `/run/secrets/`
3. Rebuild

Agents are fully isolated — separate Docker containers, separate system users, separate state directories, separate API keys.

## CI

```bash
nix flake check  # Validates the flake (no build needed for CI)
```

The `.github/workflows/check.yml` workflow runs `nix flake check --no-build` on every push and PR.
