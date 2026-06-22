{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    git
    # jq       # Uncomment for JSON processing
    # tmux     # Uncomment for terminal multiplexer
  ];
}
