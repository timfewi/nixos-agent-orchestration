{ lib, ... }:
{
  imports = [
    ./options.nix
    ./boot.nix
    ./hardening.nix
    ./locale.nix
    ./networking.nix
    ./nix-settings.nix
    ./packages.nix
    ./piper-tts-server.nix
    ./tailscale.nix
    ./users.nix
  ];
}
