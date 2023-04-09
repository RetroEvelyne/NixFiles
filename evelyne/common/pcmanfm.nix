{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pcmanfm
  ];

  xdg.configFile."pcmanfm" = {
    source = ./pcmanfm;
  };
}
