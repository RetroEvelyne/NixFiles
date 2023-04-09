{ config, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
      clock_format = "| /user@/host | /uptime | %y/%m/%d | %H:%M:%S |";
    };
  };
}
