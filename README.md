# 🪼 Tentaflake — NixOS Flake Template for Hermes Multi-Agent

> **NixOS multi-agent orchestration** — deploy isolated Hermes AI agents on a single headless machine.
> One NixOS brain · Many Hermes tentacles.

<p align="center">
  <br/>
  <pre align="center">

                                                                          ,
                                                          !MC   !##0M    m0M:
                                                         n#000   I#000x A000o
                                                          /00##l  !X00###00b  o#i
                                                      !uQW&M0000#0ZX##0#00v  A#0#:
                                                     L####000###00#000000a  /M##0J
                                                    m0XOUwmwdkabCZOLdaO0##puM000;
                             Ah                           L#00v        C##;M#00:                       |W
                             x                           O00#Q          b;#000000####                   x
                          |@@BB@&                 0#####0000q           x00#0#0####0#                M@BBBBJ
                         B%,....&BL               0##0Z0###obQ          #000!                      IB&. ..,%@\
                       Cx%,,ddA..8/r                  d000do#00        Z000v                      vvB.:CoO,.&rA
                       |:W ..0:..8Iu                 ####q \000#.M00000000####MMMM!               0:M..,Z, .#;L
                         %,.  ...%;                  #00p   x0000.##0000000#####0I                 !B,.... I%!
                          MMBBB&Oq                  ##hX   b#0000#.qhew#00X,                        x08BB%0U
             bi;;;;:::!   eUZAcuO                         r0000##00..,,\#00O                         XauAMLx   ,,:ii,,,l
             i,,I,Ol,,:q  !O@QU&L,                       z###0..000#;,,.I#00#l                      hlJLIBLl   ,,M,:M,,!
             |,Zi.l.0;,cc ;.;....;\                       \0Q,::.#000:,,:,#d                        ;:..:v ,|rl..Z...,,.C
             i.,,:...,,.;/cl;irQ;;;r                        U;:::,,,,,::!:A                        v:,\\:;;li.,,.X/v/,..
              I!!!i::,,...     .x!:!zc                     c;!;::::::::::;:                      C/!,vo     ,,......,,,
                     eIJ        q,l!iird                  o|!!;,;;;;;!,;!;i|u                  xvi;!!cv       :paU
                                 v;/I,;!iLnp           lXl!:li!:!!;;!!,:!!i!!|C|            IZi!;:zJa
                                   ;cw|;:;!ilhQLCCQZJri!;:;z!!:.li:,!!r,!iIl:!llIkQLAbbmLCclli;;lkU!
                                     nIza;:;;!!iiiii!!;;.kI!!;.Jii,,!i|;:!!ik ,:;!!iiiiii!;:,lrz.h
             CM                         ;;uLli:......,.vd|l!:..l!;,.!i!u :!llk:,....,,...!:ma;aA                     Ml
              x              Z\#JcrA#L.M     .n;.c;r.Zcili;;..#!i;.,,;iiu.,;!!!Z!;o.z r.nil!                          x
           B@@B@@M         rbii!;;!;;;iiilnUavcuhObIli!!:,.,,oll;,.,.;livl..;!ill\Jk          ouCv!;!|wCn         r@BBBBBb
         OBO,, ..&B       p;!;IIlk/xhIri:;;!iiiiii!!;:::.,.;hii!;.\Iv.:!!vr.,.::!iilicbdbbbvli!;;:!II;;!iw       # I.. .uBh
        nr%.!XiZ:.B|0    li!IJIX     vAk,mI|l,,:,,..::::,  Ui!;,.u  !u,;!l|J0 o,,::;!!!!!!!;:,Iiui/Uh|lr;!c     a  .LQU;.knU
        l!% ..\,. B:q    u;,.a           |iq.nXc:J,;h\   hl!!;::,:   I::;!livc .:o,!l/|\/I;!vduJo     oa!ill    !B. .X0..pva
          %U,. .:8&      i!\C                         vA!ii!:,;v\     uui::;i!c\   !A!U,rbbq           zv;;v     q8:.  .!%d
           iAM&XJ:      l;,h                      Uau!!!;:,!|cd         Iel!:;ii!wA                     l;!/      wJOM0Uv
          !0%.onp;;:;;!!;!r,                  0Qx!i!!;:iI!wz:             lvpII,:;iiwh                  !.i,,:;::;|w#obBMA
           hu@\.i:,,:Al,,,p                  Lll!:IIv;a;u|r                 /i.Olv:!i!U                  :;,qQWJ,,.Z.! i#,
           :!B@,o,!UUhhA,.I                 C;:!:OO:J/                          i;b;!;;U                 i:z#..m#.;!;, ::;
            ,:,..,,/Aim:,;:   ph           Ul;rv.I       Q                    w    IUc!ik           q    ,,,XMM0:..,;:!;;
                :,,,,:,,..    x           r!:cCw         x                    i     :wliiJ          x    c,..,,...,
                           OBB@BB%        b!:cC       zBBBB8I              vBBBBBL   Aii;!       rB@@@@d
                          aB8h.,C8BU      n;xLl     AB%&brQ8@%           !@%WzIL8@w  cU;!;     w@%WI;m8BX
                         pB,,/A,c.a8w     \;\d      8O,,m.o ,B!         Xuk,:b:p..BZ  ii;:    k8#,,U.w..BU
                         \B...dv, ./C     I:iI     0e/.::O;..Bci        Um\ :iQ:. @/l|p;:,    Jc:.;;0:..%IZ
                          ##......&\      ;:i\      aB . .  !%l          U%......I%|  u::!     e8.. .. x8:
                           i&BBBBWl      v:;:i       l8BBBB%L             /&BBBB%m    A!!:      IWBBBB%L
                    dc\rcxzikI!b|Je      /;lUb       :,rlIl/l;            CcCexniLC   cc;!      h0JnkAUnc/Iill|II;
                   :,,,.!;...leBBwb    c!:;mi       !,,,,,,,,i:          ,:,,.....i\   r:;l     cQBLh@xx\,,iz,h.,!
                   ;,lmOAu:CI;.%:..;Ili:,;lo      /!!,.wi.,,,!;n       \|,,.\OCQ:,l;x  CliiI/kz:..::BB.Il:.Q;!iQ,!
                  :,.cCCLCU..!;:,,oiI|\vcI        ;./,.ev;!:,Ih:o      /:I,.LCvJb,;,i   /ur/,,,;b,,;;:,..,.b.d.A.,|
                   ,,,,\l,...i       l            ,:|,,,,,,,.;i:       :;/;,.vl/,.l;,      ahep         ,,.!rcr,.,
                                                      iiiiil               iiiiil

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

Edit `flake.nix` — set your hostname, admin user, timezone:

```nix
params = {
  hostName = "my-agent-box";
  adminUser = "alice";
  timeZone = "Europe/Vienna";
};
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

---

## 🏗 Architecture — How Tentaflake Works

```
                   𜷶 𜱛 𜷷  Agent Orchestration
                One NixOS brain · Many tentacles

                          ,---------.
                        ,'  NixOS    `.
                       (    Flake      )
                ┌───────`. (Config)  ,' ──────┐
                │         `---------'         │
                │              │              │
                │              │              │
          /=====▼====\   /=====▼====\   /=====▼====\
          │ Tentacle │   │ Tentacle │   │ Tentacle │
          │ Agent A  │   │ Agent B  │   │ Agent C  │
          │ (coding) │   │(research)│   │(personal)│
          │          │   │          │   │          │
          │📦 Docker │   │📦 Docker │   │📦 Docker │
          │User:     │   │User:     │   │User:     │
          │hermes-A  │   │hermes-B  │   │hermes-C  │
          │State:    │   │State:    │   │State:    │
          │/var/lib/ │   │/var/lib/ │   │/var/lib/ │
          │hermes-A  │   │hermes-B  │   │hermes-C  │
          │          │   │          │   │          │
          │🔑 Key: A │   │🔑 Key: B │   │🔑 Key: C │
          │📚 Skills │   │📚 Skills │   │📚 Skills │
          │          │   │          │   │          │
          \==========/   \==========/   \==========/

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
