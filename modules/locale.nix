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
  time.timeZone = cfg.timeZone;
  i18n.defaultLocale = cfg.defaultLocale;
  console.keyMap = cfg.consoleKeyMap;
}
