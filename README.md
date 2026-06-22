# 🪼 Tentaflake — NixOS Flake Template for Hermes Multi-Agent

> **NixOS multi-agent orchestration** — deploy isolated Hermes AI agents on a single headless machine.
> One NixOS brain · Many Hermes tentacles.

<p align="center">
  <br/>
  <pre align="center">


                                                \#pB&  NBBL /dBp
                                                 \NBBL  NBBZdBB> 1w
                                             |#gggpBBBISLBBBBB% IBB&/
                                             ]3BBBBBBBBBBBBBBp QBBB/
                            ~                """""1111    *NBBCBBB/                 w
                            /              ,,aaag5BBE       9tBBBbbbBBL            IT
                         3dBBBpL           ]BBBBBBBFL       zdBBBBBB##F          3dBBBpp
                        ?B*\,,TBL          1S$EQBBFdpc     IdBB>                JB*l,,TNH
                       EtL-?2*'4JX            qBBEZBBp5p&L&I11gBBBga/          OLE_?3*'J4h
                        \N,^`:1B}             NBE  UBBBJBBBBBBBBBBBh            1N1'_:1B}
                }yyyyyvc  IMMMS              /#M  QBBBBB,''MBBp                  )Z9M$S  mfffff>
                E!!',:|J J4BBB9\                 @BBBTNBB,|:7BBp                 7MBMBE  |:F"p.:
                L-L]:2!|%Z'?'I_|b                *9B|!'M##-|:7#                 1i.|!I_7Y':LLi[:V
                L!_`'!!l`'T; },!Tv                 m[||||||||?z                }}|!\z,'!.|:>>>'_
                     q,,,     ;<||>b1            ,z|||!||||||||L             ,Ef!|(D   t,,,1
                               O3!!|T7br,     ~shf!I|:||!||!||||>ty\      ~&vf|:]$
                                 }5j!!|T""*f""f|!.{||![[`|[r||),!!|T"*MY""||!:lC~
                gp                 1Ir1,:'!''!!'}f|!'J!|_||]`!|Tc`'''!!'!|l,]I}               sr
               ,33\        ,w>AM>+Cbr1Li]^\]*1)"|||'.t|!``|[t`!||>c1/*,C\1f>    ,,,          )bL
             )gB##BBL     2f-l;[||;!|TfMHMMfT||!|'_.P]|.].!|Tc`!!!|TMNyc,,uut7f^||T*Kc     gBB##Bp
            }3L|u1.7Es   v!|[U1gqI;~),|!!!!!!!'!`\2/||']2},||Tbs','!||||||||!||lUlsl!?\   ZB!]L}`NO
            93LT}t_]LN  )r:Jz       *pzt[u[1[I1 55f|!:}} \?.!||>51,[.,!l!l}\v11A  F1!|m   fQ`]7,_3?
             SNL11gB5   /|l5                ,wF{j|!!,?}    [f,!||>QC t+py<A        3*||    4bs11gB
              hg1}/f****:,I              }E{"|!!:.1?1       \2]1.|!T*h              z';Y***MUzwcap
              }PBfF!',k,|[7            }z*|:=;I@zID            \15!,;|Yh             ]!\gL[:?FMEM]
              t:Mkf:dB1S<|J           ?/||\Ccf                    f2l;!TH           \!!N;]#`=lgt|2
                <,l!.?P:!_  ?M        ?|[Cn     Ht              7M  */}|7z      ?M}  /!TM"f!\,,1
                   =+<+++ }Bdppp     Ct|;J    }BggZp          qpggpL 32]:0    }Bgpgp  ++++++
                         ?BM"T"MBh   ]!|*    @BM""YME        q#"""MND Kr![   TBM"""MpL
                        ?EL_{zF_43   ?!|2   gOt_P}t`Bb      d3'-KP<TLZy{!]  TFL`7zt_4qt
                         lb,"'_\B,   2!|K   ?)L_"?_\E|      l3[~*'`3t~),!3   ]L.T!_ld,
                          5MM#MY     i:;Z     ZM###M          QM##NS  1*|T    QM###M@[.....
                    ?T^^^'''$d66w   V!!1     I~~~~??/        FTT"TTT\ ?F!|t   hBpppPz|.}<,!J
                    }[lxE;],!$T*'T7f!|mz   \Y!!~,!||[7c    ]f!!lWb[:'T 1r!TT%"'")Q/.f!\>yq!7
                    .[7QBBf.T!,ls\w%s      [[r!~f~<!?!J    E[r!JBBL|?!z YJ\,l,u}c,.,'|J,t3`'/
                     ,1,,,,,}               ,'!.....'\      c|'.!:!',}              !,11,,12

                                                tentaflake.dev


  </pre>
  <p align="center">
    <i>Declaratively deploy & manage multiple isolated Hermes AI agents
    on a single NixOS machine — each with its own secrets, skills, and personality.</i>
    <br/>
    <sub>Clone → configure → rebuild. Your swarm, your NixOS, your rules.</sub>
  </p>
</p>

<p align="center">
  <a href="https://tentaflake.dev/?utm_source=github&utm_medium=readme&utm_campaign=readme-link"><img src="https://img.shields.io/badge/tentaflake.dev-00d4ff?style=flat-square&labelColor=0a1628" alt="tentaflake.dev"/></a>
  <a href="https://github.com/timfewi/tentaflake/actions"><img src="https://img.shields.io/github/actions/workflow/status/timfewi/tentaflake/check.yml?branch=main&style=flat-square" alt="NixOS flake CI build status"/></a>
  <a href="https://github.com/timfewi/tentaflake/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="MIT license"/></a>
  <a href="https://github.com/timfewi/tentaflake/blob/main/CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square" alt="Pull requests welcome"/></a>
  <a href="#"><img src="https://img.shields.io/badge/nixos-unstable-blue?style=flat-square&logo=nixos" alt="NixOS unstable"/></a>
  <a href="#"><img src="https://img.shields.io/badge/go-1.21+-00ADD8?style=flat-square&logo=go" alt="Go 1.21+"/></a>
  <br/>
  <a href="#-quick-start"><img src="https://img.shields.io/badge/_Quickstart-%23262626?style=for-the-badge"/></a>
  <a href="#-features"><img src="https://img.shields.io/badge/_Features-%23262626?style=for-the-badge"/></a>
  <a href="#-examples"><img src="https://img.shields.io/badge/_Examples-%23262626?style=for-the-badge"/></a>
  <a href="#-architecture"><img src="https://img.shields.io/badge/_Architecture-%23262626?style=for-the-badge"/></a>
</p>

---

## Features

| Capability | Description |
|---|---|
| **Multi-Agent** | Run any number of isolated Hermes agents on one machine |
| **Per-Agent Secrets** | Each agent gets its own API keys — no cross-contamination |
| **Docker Ephemeral** | Containers are stateless; personality + state live on mounted volumes |
| **NixOS Declarative** | Everything defined in one flake — `nixos-rebuild switch` applies changes |
| **Agenix Support** | Encrypt secrets in-repo with age/agenix — decrypted at build time |
| **TTS Ready** | Built-in Piper TTS server (OpenAI-compatible `/v1/audio/speech`) |
| **Live ISO** | Bootable installer USB with interactive setup wizard — `nix build .#installer-iso` |
| **Tailscale** | Pre-configured Tailscale module for secure networking |

### The Tentaflake Ethos

| **Declarative Swarm** | One flake defines every agent. `nixos-rebuild switch` grows or prunes tentacles. |
|---|---|
| **Hard Isolation** | Every tentacle is its own container, user, state dir, API key. Secrets never cross. |
| **Reproducible by Nature** | Git clone → configure → rebuild. Same flake, same system. NixOS guarantee. |
| **Your Keys, Your Rules** | You host. You encrypt. You control. No SaaS, no vendor, no third-party agent router. Self-sovereign AI infrastructure. |

---

##  Quick Start

### 1. Clone

```bash
git clone https://github.com/timfewi/tentaflake
cd tentaflake
```

### 2. Customize

Edit `flake.nix` — set your hostname, admin user, timezone via `tentaflake.*` options:

```nix
{
  tentaflake.hostName = "my-agent-box";
  tentaflake.adminUser = "alice";
  tentaflake.timeZone = "Europe/Vienna";
}
```

### 3. Define an agent

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
sudo cp hermes.env.example /run/secrets/hermes-coding.env
sudo chmod 600 /run/secrets/hermes-coding.env
sudo vi /run/secrets/hermes-coding.env
```

### 5. Build & deploy

```bash
nix flake check
sudo nixos-rebuild switch --flake .#agent-host
```

##  Usage as Flake Input

Consume tentaflake as a reusable module library in your own flake:

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

You get:
- **`tentaflake.nixosModules.default`** — all base NixOS modules with configurable `tentaflake.*` options
- **`tentaflake.lib.x86_64-linux.mkHermesAgent`** — agent creation helper (import and use in `my-agents.nix`)
- **`tentaflake.lib.x86_64-linux.constants`** — default values (hostName, stateVersion, locale, etc.)

See [`examples/consumer-flake.nix`](examples/consumer-flake.nix) for a full worked example.

---

## 🏗 Architecture — How Tentaflake Works

```
                   𜷶 𜱛 𜷷  Agent Orchestration
                One NixOS brain · Many tentacles

                          ,---------.
                        ,'  NixOS    `.
                       (    Flake      )
                ┌───────`. (Config)  ,' ──────┐──────────────┐
                │         `---------'         │              │
                │              │              │              │
                │              │              │              │
          /=====▼====\   /=====▼====\   /=====▼====\   /=====▼====\
          │ Tentacle │   │ Tentacle │   │ Tentacle │   │ Tentacle │
          │ Agent A  │   │ Agent B  │   │ Agent C  │   │ Agent N  │
          │ (coding) │   │(research)│   │(personal)│   │   (...)  │
          │          │   │          │   │          │   │          │
          │📦 Docker │   │📦 Docker │   │📦 Docker │   │📦 Docker │
          │User:     │   │User:     │   │User:     │   │User:     │
          │hermes-A  │   │hermes-B  │   │hermes-C  │   │hermes-N  │
          │State:    │   │State:    │   │State:    │   │State:    │
          │/var/lib/ │   │/var/lib/ │   │/var/lib/ │   │/var/lib/ │
          │hermes-A  │   │hermes-B  │   │hermes-C  │   │hermes-N  │
          │          │   │          │   │          │   │          │
          │🔑 Key: A │   │🔑 Key: B │   │🔑 Key: C │   │🔑 Key: N │
          │📚 Skills │   │📚 Skills │   │📚 Skills │   │📚 Skills │
          │          │   │          │   │          │   │          │
          \==========/   \==========/   \==========/   \==========/

      ───────────────── Shared Services ─────────────────
     🎤 Piper TTS   🔗 Tailscale   🗄️ Docker   🔐 Agenix
     (port 5001)    (mesh VPN)     (runtime)    (secrets)
```

### Key Design Decisions

| Decision | Rationale |
|---|---|
| **One container per agent** | Full isolation — no shared context, separate filesystems |
| **Host networking** | Agents reach local services (Piper, tailscale) via `localhost` |
| **SeedDir over :ro volumes** | Hermes can write learned skills; base files seed once, never overwrite |
| **Agenix or envFile** | Choose between encrypted-in-repo or plain-file secrets |
| **Template stays generic** | This repo is a template. Fork it, add your agents, keep your secrets. |

---

## Agent Configuration

### `mkHermesAgent` options

| Option | Type | Default | Description |
|---|---|---|---|
| `name` | `string` | *(required)* | Agent identifier (user, group, container, state dir) |
| `stateDir` | `string` | `/var/lib/hermes-<name>` | Isolated state directory |
| `image` | `string` | `nousresearch/hermes-agent:latest` | OCI container image |
| `envFile` | `path` | `null` | Path to `.env` file (injected via `--env-file`) |
| `agenixFile` | `path` | `null` | Path to agenix-decrypted env file |
| `seedDir` | `path` | `null` | Directory with SOUL.md, AGENTS.md, skills/ (seeded on first boot) |
| `settings` | `attrset` | `null` | Hermes `config.yaml` (model routing, TTS, STT, toolsets) |
| `extraVolumes` | `list` | `[]` | Extra `host:container:mode` mounts |
| `extraEnvironment` | `attrset` | `{}` | Extra env vars for the container |
| `extraContainerConfig` | `attrset` | `{}` | Extra Docker options (merged deep) |
| `autoStart` | `bool` | `true` | Auto-start with systemd |
| `cmd` | `list` | `["gateway" "run" "--replace"]` | Container entrypoint |

---

## Secret Management

Two patterns — choose what fits your workflow:

### 1. `.env` file (simpler, local-only)

```nix
mkHermesAgent {
  name    = "my-agent";
  envFile = "/run/secrets/my-agent.env";
}
```

Place a plaintext `.env` file at the runtime path. **Never commit it to Git.**

### 2. Agenix (encrypted in Git)

Encrypt secrets as `.age` files — safe to commit, decrypted only at NixOS activation.

```nix
mkHermesAgent {
  name       = "my-agent";
  agenixFile = "/run/agenix/my-agent-env";
}
```

```bash
# Create encrypted secret
echo "OPENROUTER_API_KEY=sk-or-..." | agenix -e secrets/my-agent.env.age --stdin

# Rebuild — secrets never touch the Nix store
sudo nixos-rebuild switch --flake .#agent-host
```

 **Full guide:** [`docs/04-agenix-secrets.md`](docs/04-agenix-secrets.md) — setup, architecture, troubleshooting  
 **Template:** [`secrets.nix.example`](secrets.nix.example) — copy to `secrets.nix` to start

Both patterns keep secrets **out of the Nix store** and **never in Nix evaluation**.

---

## Available Modules

| Module | What it configures |
|---|---|
| `modules/default.nix` | Module aggregator (imports all others) |
| `boot.nix` | systemd-boot, EFI, kernel params |
| `locale.nix` | Timezone, locale, console keymap |
| `networking.nix` | Hostname, nftables firewall, NetworkManager |
| `users.nix` | Admin user (wheel + networkmanager groups) |
| `nix-settings.nix` | Flakes, auto-GC, trusted-users, substituters |
| `packages.nix` | curl, git, jq, tmux, vim, and more |
| `hardening.nix` | Sysctl hardening, AppArmor, journald limits |
| `tailscale.nix` | Tailscale with SSH + tag:auto (optional) |
| `piper-tts-server.nix` | Local TTS via Piper (OpenAI-compatible API) |
| `hermes-firstboot.nix` | USB env detection + first-boot TUI wizard (live ISO) |

---

## Examples

### Two agents — coding assistant + web researcher

```nix
{ mkHermesAgent }:
[
  (mkHermesAgent {
    name    = "coding";
    envFile = "/run/secrets/hermes-coding.env";
    settings = {
      model.default = "openrouter/anthropic/claude-sonnet-4";
      model.provider = "openrouter";
      terminal.backend = "docker";
      web.backend = "disabled";
      toolsets = [ "terminal" "memory" "file" "skills" ];
    };
  })
  (mkHermesAgent {
    name    = "research";
    envFile = "/run/secrets/hermes-research.env";
    settings = {
      model.default = "openrouter/deepseek/deepseek-v4-flash";
      model.provider = "openrouter";
      web.backend = "firecrawl";
      toolsets = [ "terminal" "web" "memory" "file" "skills" ];
    };
  })
]
```

### Installer ISO (bare-metal deployment)

```bash
# Build the bootable installer ISO
nix build .#installer-iso

# Write to USB (replace /dev/sdX with your device)
sudo cp result/iso/tentaflake.iso /dev/sdX

# Boot it — the interactive TUI wizard will guide you through
# partitioning and installing NixOS with this orchestration framework.
```

---

## Commands

```bash
# Validate flake
nix flake check

# Build installer ISO
nix build .#installer-iso

# Dry-run activation
sudo nixos-rebuild dry-activate --flake .#agent-host

# Build and deploy
sudo nixos-rebuild switch --flake .#agent-host

# Rollback
sudo nixos-rebuild switch --rollback

# List running agents
docker ps --filter "name=hermes-"

# View agent logs
docker logs hermes-coding

# Chat with an agent
docker exec -it hermes-coding hermes chat
```

---

## `hermes-auditd` — Filesystem Audit Daemon

Go-based daemon that monitors Hermes agent state directories for filesystem changes. Lives at [`pkgs/hermes-auditd/`](pkgs/hermes-auditd/).

Uses **fsnotify** for recursive directory watching, debounces rapid events (100 ms coalescing window per file), and persists events to **SQLite** (pure Go via `modernc.org/sqlite` — no CGo).

Agent names extracted from path convention: `/var/lib/hermes-<name>/...` → `<name>`.

### Data Flow

```
fsnotify event → isIgnored? (filter .git, node_modules, .db files)
               → toEvent() (stat file for size, extract agent from path)
               → debounceMap (100ms per-file coalesce)
               → hermes.Event channel (buffered 100)
               → store.Start() consumer goroutine
                   ├── INSERT INTO events (SQLite, WAL mode)
                   └── non-blocking forward to notifyCh (broadcast, future use)
               → PruneLoop (every 10 min, delete older than retention)
```

### Event Model

```go
type Event struct {
    ID        int64     `json:"id"`
    Agent     string    `json:"agent"`       // extracted from /var/lib/hermes-<name>/...
    File      string    `json:"file"`        // absolute path to changed file
    Op        string    `json:"op"`          // create|write|remove|rename|chmod
    Timestamp time.Time `json:"timestamp"`
    Size      int64     `json:"size,omitempty"`
}
```

### Configuration

All via environment variables:

| Variable | Default | Description |
|---|---|---|
| `AUDIT_PORT` | `9090` | HTTP/WebSocket listen port (future use) |
| `AUDIT_DB_PATH` | `/var/lib/hermes-audit/events.db` | Path to SQLite database |
| `AUDIT_WATCH_DIRS` | *(required)* | Comma-separated directories to monitor |
| `AUDIT_RETENTION_HOURS` | `24` | Event retention window before pruning |

### Watcher Features

- **Recursive** — walks directory tree on startup, adds every subdirectory to fsnotify
- **Noise filter** — skips `.git`, `node_modules`, SQLite auxiliary files (`.db`, `.db-wal`, `.db-shm`)
- **New directories** — on `Create` events, automatically watches new subdirectories
- **Agent extraction** — parses `/var/lib/hermes-<name>/...` → `<name>`, falls back to `"unknown"`
- **Graceful shutdown** — flushes pending events on SIGINT/SIGTERM

### Store Features

- Built with `modernc.org/sqlite` — pure Go, no CGo dependency
- WAL journal mode with `synchronous=NORMAL` for read concurrency
- Schema auto-migrated on startup, no migration tooling needed
- Query: filter by agent name, time range, with limit
- Stats: per-agent event counts over any time window
- Pruning: automatic, runs every 10 minutes, deletes events older than retention period

### Build & Run

```bash
# Build
cd pkgs/hermes-auditd
go build -o hermes-auditd ./cmd/hermes-auditd

# Run (example)
export AUDIT_WATCH_DIRS="/var/lib/hermes-coding,/var/lib/hermes-research"
export AUDIT_DB_PATH="/var/lib/hermes-audit/events.db"
./hermes-auditd
```

### Package Structure

```
pkgs/hermes-auditd/
├── cmd/hermes-auditd/main.go     # Entrypoint, lifecycle
├── internal/
│   ├── config/config.go          # Environment variable config
│   ├── hermes/event.go           # Shared Event type (only cross-package type)
│   ├── watcher/watcher.go        # fsnotify watcher + debounce
│   └── store/
│       ├── schema.go             # SQLite DDL + pragmas
│       └── store.go              # Insert, Query, Stats, Prune
```

---

## Installer ISO — Bootable USB Deployment

Bootable NixOS installer ISO with an interactive installation wizard. Designed for deploying this orchestration framework onto bare metal.

### Build

```bash
# Using the convenience script
./scripts/build-iso.sh

# Or directly with nix
nix build .#installer-iso
```

ISO configured in [`installer/iso.nix`](installer/iso.nix). Features:
- **UEFI + USB hybrid boot** — works with modern firmware and `dd` to USB
- **Full repo embedded** at `/etc/tentaflake/` — self-contained, no network fetch for sources
- **NetworkManager** active for install-time internet
- **SSH access** with password auth for remote debugging during installation
- **TTY1 auto-launch** — root auto-login, installer starts immediately

### Interactive Installer (`installer.sh`)

`dialog`-based TUI wizard that guides through full NixOS installation:

| Step | What happens |
|------|-------------|
| **1. Welcome** | Explains the installer, requirements, confirms intent |
| **2. Hostname** | Prompts for system hostname (default: `agent-machine`) |
| **3. Username** | Prompts for primary admin username (default: `agent`) |
| **4. Password** | Password entry with confirmation loop |
| **5. Disk** | Menu of detected disks via `lsblk` — ALL DATA WILL BE WIPED |
| **6. Timezone** | Timezone input (default: `UTC`) |
| **7. Confirm** | Summary review with final confirmation |
| **8. Partition** | Creates GPT layout: 1 GB EFI (FAT32) + rest as ext4 root |
| **9. Hardware** | Runs `nixos-generate-config` on target |
| **10. Config** | Copies modules, generates `user-config.nix` + `flake.nix` |
| **11. Install** | Runs `nixos-install --flake` (10–15 min build) |
| **12. Done** | Sets passwords, copies examples, unmounts, reboots |

### Partition Layout

```
GPT:
  1: 1 MiB – 1025 MiB   FAT32   BOOT   esp
  2: 1025 MiB – 100%    ext4    nixos
```

Works with NVMe (`nvme0n1p1/p2`), mmcblk, and SATA (`sda1/sda2`) naming.

### Boot Flow

1. Boot ISO → systemd starts → root auto-login on TTY1
2. Bash `interactiveShellInit` detects TTY1, sets `INSTALLER_RUN=1`
3. Launches `/etc/tentaflake/installer/installer.sh`
4. After installation completes, system unmounts and reboots

### Flake Configuration

ISO exposed as NixOS configuration in `flake.nix`:

```nix
nixosConfigurations.installer-iso = nixpkgs.lib.nixosSystem {
  inherit system specialArgs;
  modules = [ ./installer/iso.nix ];
};
```

Convenience package:

```bash
nix build .#installer-iso
```

---

## Contributing

This is a community template — contributions welcome!

1. Fork the repo
2. Create a feature branch (`git checkout -b feat/amazing`)
3. Commit your changes (`git commit -m "feat: add amazing thing"`)
4. Push (`git push origin feat/amazing`)
5. Open a Pull Request

Please keep the template **generic** — no domain-specific code belongs here. That goes in your fork.

---

## License

<p align="center">
  MIT — see <a href="https://github.com/timfewi/tentaflake/blob/main/LICENSE">LICENSE</a><br/>
  <sub>Piper voice models distributed under their respective MIT licenses.</sub>
</p>
