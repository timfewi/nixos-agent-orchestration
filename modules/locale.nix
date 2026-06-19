{ params, ... }:
{
  time.timeZone = params.timeZone or "UTC";
  i18n.defaultLocale = params.defaultLocale or "en_US.UTF-8";
  console.keyMap = params.consoleKeyMap or "us";
}
