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
  users.users.${cfg.adminUser} = {
    isNormalUser = true;
    description = cfg.adminDescription;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = cfg.adminShell;
  };

  # Enable a solid default shell
  programs.bash.enable = true;
}
