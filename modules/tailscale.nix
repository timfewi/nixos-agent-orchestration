{ params, ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    extraUpFlags = [
      "--advertise-tags=tag:agent"
      "--hostname=${params.hostName or "agent-host"}"
      "--ssh"
    ];
  };
}
