# Changelog

All notable changes to tentaflake are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `hermes-top` — live TUI dashboard (bubbletea) of agent filesystem activity, launched via `hermes top`. Reads the `hermes-auditd` SQLite DB directly (no network surface — runs over Tailscale SSH). Implements the read side the daemon previously discarded (the `internal/store` already had the query methods).
- `hermes-auditd` is now wired up: enabled by default on `agent-host`, `watchDirs` auto-derives from the agents defined in `my-agents.nix`, runs as an unprivileged `hermes-audit` user with only `CAP_DAC_READ_SEARCH`, and stores its DB group-readable so the admin can run `hermes top` without sudo.
- `internal/store`: `Since(afterID, limit)` (incremental tail) and `AgentRows(window)` (per-agent activity summary) read helpers.
- `modules/shell.nix` — operator shell experience for SSH/console: `hermes` agent-management CLI, dynamic `tentaflake-status` login banner, Starship/bash prompt, completion, and a curated modern CLI tool set. Toggle via `tentaflake.shell.*`. See [`docs/06-shell.md`](docs/06-shell.md).
- `modules/piper-tts-server.nix` — local TTS via Piper (OpenAI-compatible `/v1/audio/speech`)
- `modules/hermes-firstboot.nix` — USB env detection + first-boot TUI wizard
- `nixosConfigurations.live-agent` + `nix build .#live-agent-iso` — bootable ISO with Hermes + TTS

### Fixed
- `store.go`: fixed event time-window comparisons (`Stats`, `Prune`) — stored RFC3339 timestamps were string-compared against SQLite's `datetime('now', …)` (space-separated) form, which only agreed when the date differed, so same-day events outside the window were mis-counted and never pruned. Now normalized via `datetime(timestamp)`.
- `cmd/hermes-auditd/main.go`: removed the misleading "HTTP/WebSocket server not implemented — notify channel discarded" warning; the notify channel is now drained intentionally (data is read back via `hermes-top`).
- `watcher.go`: added `Close()` method to fix fsnotify file descriptor leak
- `flake.nix`: fixed `mkHermesAgent` import (was attrset, now unwrapped function)
- `watcher.go`: fixed `FlushAll` timer race with `entry.timer = nil` guard after `Stop()`
- CI: added `go test` step to GitHub Actions workflow
- `installer.sh`: removed dead `spinner()` function
- `store.go`: removed unused `done` channel
- Docs: fixed nftables attribution (`hardening.nix` → `networking.nix`)

## [0.1.0] — 2026-06-19

### Added
- Initial release: NixOS flake template for multi-agent Hermes orchestration
- `lib/mkHermesAgent.nix` — declarative Docker-based Hermes agent creation
- `lib/constants.nix` — template-level defaults (stateVersion, locale, hostname)
- `modules/` — reusable NixOS modules (boot, locale, networking, users, hardening, tailscale, etc.)
- `pkgs/hermes-auditd/` — Go daemon for filesystem event auditing with SQLite
- `installer/` — interactive TUI installer ISO (`nix build .#installer-iso`)
- `docs/` — quickstart guide, agent tips, skill index, and 4 bundled Hermes skills
- GitHub Actions CI: `nix flake check` on PR and push to main

[Unreleased]: https://github.com/timfewi/tentaflake/compare/v0.1.0...main
[0.1.0]: https://github.com/timfewi/tentaflake/releases/tag/v0.1.0
