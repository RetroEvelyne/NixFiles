{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nsxiv
  ];
  xdg.configFile."nsxiv" = {
    source = ./nsxiv;
  };
  xresources.properties = {
    "Nsxiv.window.foreground" = "#D6DEEB";
    "Nsxiv.window.background" = "#1E2127";
    "Nsxiv.bar.background" = "#2C323D";
    "Nsxiv.bar.foreground" = "#D6DEEB";
  };
}
