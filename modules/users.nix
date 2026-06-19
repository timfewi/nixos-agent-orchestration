{ params, pkgs, ... }:
{
  users.users.${params.adminUser or "admin"} = {
    isNormalUser = true;
    description = params.adminDescription or "System Administrator";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = params.adminShell or "${pkgs.bash}/bin/bash";
  };

  # Enable a solid default shell
  programs.bash.enable = true;
}
