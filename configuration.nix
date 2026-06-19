{
  config,
  lib,
  pkgs,
  params,
  mkHermesAgent,
  ...
}:

let
  # ── Import your agent definitions ──
  # Create my-agents.nix and uncomment the line below.
  # myAgents = import ./my-agents.nix { inherit mkHermesAgent; };
  myAgents = [ ];
in
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/users.nix
    ./modules/nix-settings.nix
    ./modules/packages.nix
    ./modules/hardening.nix

    # Optional: uncomment to enable Tailscale
    # ./modules/tailscale.nix

    # ── Agent modules from my-agents.nix ──
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
