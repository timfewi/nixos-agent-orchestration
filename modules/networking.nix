{ params, ... }:
{
  networking = {
    hostName = params.hostName or "agent-host";
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
