{
  description = "Generic NixOS flake template for running multiple isolated Hermes agents on one headless machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Optional: use hermes-agent NixOS module for single-agent setups or container images
    hermes-agent = {
      url = "github:NousResearch/hermes-agent";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Optional: uncomment for home-manager support
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Optional: uncomment for agenix encrypted secrets
    # agenix = {
    #   url = "github:ryantm/agenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      # Root of the repo — used by installer ISO to embed source
      repoRoot = ./.;

      # ── Template constants (stateVersion, locale defaults) ──
      constants = import ./lib/constants.nix;

      # ── Shared mkHermesAgent helper ──
      mkHermesAgent = (import ./lib { inherit pkgs lib; }).mkHermesAgent;

      # Module set imported by external consumers and built-in hosts
      tentaflakeModules = import ./modules/default.nix;

      # Shared specialArgs — no params, just helpers
      baseSpecialArgs = {
        inherit
          inputs
          self
          mkHermesAgent
          repoRoot
          constants
          ;
      };
    in
    {
      # ── Exported module set ──
      nixosModules.default = tentaflakeModules;

      # ── Exported helpers ──
      lib.${system} = { inherit mkHermesAgent constants; };

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

      # ── Example host (consumes self via nixosModules) ──
      nixosConfigurations.agent-host = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = baseSpecialArgs // {
          isLiveISO = false;
        };
        modules = [
          # Configure tentaflake options directly — no params specialArg
          {
            tentaflake.hostName = "agent-host";
            tentaflake.adminUser = "admin";
            tentaflake.adminDescription = "System Administrator";
            tentaflake.adminShell = "${pkgs.bash}/bin/bash";
            tentaflake.timeZone = "UTC";
            tentaflake.defaultLocale = constants.defaultLocale;
            tentaflake.consoleKeyMap = constants.consoleKeyMap;
            tentaflake.stateVersion = constants.stateVersion;
          }
          self.nixosModules.default
          ./configuration.nix
        ];
      };

      # ── Bootable installer ISO ──
      # Build with: nix build .#installer-iso
      # Embeds entire repo at /etc/tentaflake/ on the ISO
      nixosConfigurations.installer-iso = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = baseSpecialArgs // {
          isLiveISO = false;
        };
        modules = [ ./installer/iso.nix ];
      };

      # ── Live agent ISO (Hermes agents + Piper TTS out of the box) ──
      # Build with: nix build .#live-agent-iso
      # Boot → enter API keys → agents running
      nixosConfigurations.live-agent = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = baseSpecialArgs // {
          isLiveISO = true;
        };
        modules = [
          {
            tentaflake.hostName = "live-agent";
            tentaflake.adminUser = "admin";
            tentaflake.adminDescription = "System Administrator";
            tentaflake.adminShell = "/run/current-system/sw/bin/bash";
            tentaflake.timeZone = "UTC";
            tentaflake.defaultLocale = constants.defaultLocale;
            tentaflake.consoleKeyMap = constants.consoleKeyMap;
            tentaflake.stateVersion = constants.stateVersion;
          }
          self.nixosModules.default
          ./configuration.nix
          ./installer/live-iso.nix
        ];
      };

      # ── Convenience packages ──
      packages.${system} = {
        installer-iso = self.nixosConfigurations.installer-iso.config.system.build.isoImage;
        live-agent-iso = self.nixosConfigurations.live-agent.config.system.build.isoImage;
        piper-voices = pkgs.callPackage ./pkgs/piper-voices { };
      };
    };
}
