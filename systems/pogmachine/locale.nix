{ config, ... }:

{
  # Time zone
  time.timeZone = "Europe/London";

  # Internationalisation properties
  i18n.defaultLocale = "en_GB.utf8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };
}
