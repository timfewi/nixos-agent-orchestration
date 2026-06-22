{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.tentaflake;
in
{
  networking = {
    hostName = cfg.hostName;
    networkmanager.enable = true;
    nftables.enable = true;
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
      logRefusedConnections = true;
    };
  };
}
