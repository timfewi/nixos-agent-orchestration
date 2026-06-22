{ lib, ... }:
let
  inherit (import ../lib/constants.nix)
    hostName
    adminUser
    adminDescription
    adminShell
    defaultLocale
    consoleKeyMap
    stateVersion
    ;
in
{
  options.tentaflake = {
    hostName = lib.mkOption {
      type = lib.types.str;
      default = hostName;
      description = "System hostname";
    };
    adminUser = lib.mkOption {
      type = lib.types.str;
      default = adminUser;
      description = "Primary admin username";
    };
    adminDescription = lib.mkOption {
      type = lib.types.str;
      default = adminDescription;
      description = "Description for the admin user";
    };
    adminShell = lib.mkOption {
      type = lib.types.str;
      default = adminShell;
      description = "Shell for the admin user";
    };
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "UTC";
      description = "System timezone";
    };
    defaultLocale = lib.mkOption {
      type = lib.types.str;
      default = defaultLocale;
      description = "Default system locale";
    };
    consoleKeyMap = lib.mkOption {
      type = lib.types.str;
      default = consoleKeyMap;
      description = "Console keymap";
    };
    stateVersion = lib.mkOption {
      type = lib.types.str;
      default = stateVersion;
      description = "NixOS state version";
    };
  };
}
