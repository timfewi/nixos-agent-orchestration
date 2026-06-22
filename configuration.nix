{
  config,
  lib,
  pkgs,
  isLiveISO ? false,
  ...
}:
let
  cfg = config.tentaflake;
  # ── Import your agent definitions ──
  # In a fork, replace with: myAgents = import ./my-agents.nix { inherit mkHermesAgent; };
  # On the template, agents are empty — user provides their own my-agents.nix
  myAgents = [ ];
in
{
  imports =
    myAgents
    ++ lib.optionals (!isLiveISO) [
      ./hardware-configuration.nix
    ];

  # ── OCI container backend (required for agent containers) ──
  virtualisation.oci-containers.backend = "docker";
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  # ── Admin user in docker group for container management ──
  users.users.${cfg.adminUser}.extraGroups = [ "docker" ];

  system.stateVersion = cfg.stateVersion;
}
