{
  config,
  lib,
  pkgs,
  params,
  mkHermesAgent,
  isLiveISO ? false,
  ...
}:

let
  # ── Import your agent definitions ──
  # In a fork, replace with: myAgentsConfig = import ./my-agents.nix;
  # On the template, agents are empty — user provides their own my-agents.nix
  myAgents = [ ];
in
{
  imports = [
    ./modules/boot.nix
    ./modules/hardening.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/nix-settings.nix
    ./modules/packages.nix
    ./modules/tailscale.nix
    ./modules/users.nix
  ]
  # ISO skips desktop module and hardware-config
  ++ lib.optionals (!isLiveISO) [
    ./modules/desktop/niri-noctalia.nix
    ./hardware-configuration.nix
  ]
  ++ myAgents;

  # ── OCI container backend (required for agent containers) ──
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  # ── Admin user in docker group for container management ──
  users.users.${params.adminUser}.extraGroups = [ "docker" ];

  system.stateVersion = params.stateVersion;
}
