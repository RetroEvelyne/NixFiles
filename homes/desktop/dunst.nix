{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        # Style
        format = "<b>%s</b>\n%b";
        font = "Iosevka 10";
        width = 370;
        height = 370;
        offset = "0x50";
        padding = 5;
        frame_width = 2;

        # Location
        monitor = 0;
        origin = "bottom-center";
      };

      urgency_low = {
        background = "#121317";
        foreground = "#D6DEEB";
        frame_color = "#2C323D";
        timeout = 3;
      };

      urgency_normal = {
        background = "#121317";
        foreground = "#D6DEEB";
        frame_color = "#2C323D";
        timeout = 5;
      };

      urgency_critical = {
        background = "#121317";
        foreground = "#D6DEEB";
        frame_color = "#E06C75";
        timeout = 10;
      };
    };
  };
}
