{
  config,
  lib,
  pkgs,
  ...
}:

let
  # The interactive TUI wizard (runs via .bashrc on TTY1)
  firstbootScript = pkgs.writeShellScriptBin "hermes-firstboot" ''
    ${builtins.readFile ./firstboot.sh}
  '';

  # USB HERMES_ENV auto-detector (runs as systemd service before Docker)
  envDetect = pkgs.writeShellScript "hermes-env-detect" ''
    set -euo pipefail

    ENV_DIR="/run/hermes"
    mkdir -p "$ENV_DIR"

    # ── Copy env files from a labeled HERMES_ENV USB, if present ──
    USB_DEV=$(blkid -l -o device -t LABEL=HERMES_ENV 2>/dev/null || true)
    if [ -n "$USB_DEV" ]; then
      mkdir -p /mnt/hermes-env
      if mount "$USB_DEV" /mnt/hermes-env 2>/dev/null; then
        for f in /mnt/hermes-env/*.env; do
          [ -f "$f" ] || continue
          name=$(basename "$f" .env)
          cp "$f" "''${ENV_DIR}/''${name}.env"
          chmod 600 "''${ENV_DIR}/''${name}.env"
          echo "hermes-env-detect: loaded ''${name}.env from USB"
        done
        umount /mnt/hermes-env 2>/dev/null || true
      fi
      rmdir /mnt/hermes-env 2>/dev/null || true
    fi

    # ── Ensure every agent has an env file so `docker run --env-file` never
    # fails on a cold boot. Agents are enumerated from their systemd units,
    # so this stays generic (works for docker- and podman- backends and any
    # agent set). Missing files get an empty placeholder; the firstboot
    # wizard later overwrites them with real keys and restarts the units. ──
    for unit in $(systemctl list-unit-files --no-legend 'docker-hermes-*.service' 'podman-hermes-*.service' 2>/dev/null | awk '{print $1}'); do
      name=''${unit#docker-hermes-}
      name=''${name#podman-hermes-}
      name=''${name%.service}
      envf="''${ENV_DIR}/''${name}.env"
      if [ ! -f "$envf" ]; then
        touch "$envf"
        chmod 600 "$envf"
        echo "hermes-env-detect: created placeholder ''${name}.env (awaiting firstboot wizard)"
      fi
    done
  '';

  # USB HERMES_DATA auto-mounter (persistent state across reboots)
  dataMount = pkgs.writeShellScript "hermes-data-mount" ''
    set -euo pipefail

    USB_DEV=$(blkid -l -o device -t LABEL=HERMES_DATA 2>/dev/null || true)
    [ -z "$USB_DEV" ] && exit 0

    mkdir -p /mnt/hermes-data
    mount "$USB_DEV" /mnt/hermes-data 2>/dev/null || exit 0

    # Symlink agent state dirs to USB for persistence
    for dir in /var/lib/hermes-*; do
      [ -d "$dir" ] || continue
      name=$(basename "$dir")
      usb_dir="/mnt/hermes-data/''${name}"
      mkdir -p "$usb_dir"
      # Only symlink if not already a symlink
      if [ ! -L "$dir" ]; then
        rm -rf "$dir"
        ln -s "$usb_dir" "$dir"
        echo "hermes-data-mount: ''${dir} → ''${usb_dir}"
      fi
    done
  '';
in
{
  # ── USB env detection (before Docker starts) ──
  systemd.services.hermes-env-detect = {
    description = "Detect USB HERMES_ENV partition and load agent .env files";
    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];
    before = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${envDetect}";
    };
  };

  # ── USB data persistence (after env + tmpfiles, before Docker) ──
  # MUST run after systemd-tmpfiles-setup: mkHermesAgent creates the
  # /var/lib/hermes-<name> state dirs via tmpfiles. If this service ran first
  # the glob below would match nothing and persistence would silently no-op.
  systemd.services.hermes-data-mount = {
    description = "Mount USB HERMES_DATA partition for persistent agent state";
    requires = [ "local-fs.target" ];
    after = [
      "local-fs.target"
      "systemd-tmpfiles-setup.service"
      "hermes-env-detect.service"
    ];
    before = [ "docker.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${dataMount}";
    };
  };

  # ── Run firstboot wizard on TTY1 auto-login ──
  programs.bash.interactiveShellInit = ''
    if [ -z ''${HERMES_FIRSTBOOT_DONE:-} ] && [ "$(tty 2>/dev/null)" = "/dev/tty1" ]; then
      export HERMES_FIRSTBOOT_DONE=1
      hermes-firstboot
    fi
  '';

  # ── Expose scripts as packages ──
  environment.systemPackages = [ firstbootScript ];
}
