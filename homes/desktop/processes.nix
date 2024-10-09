{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xorg.xkill # Kill X11 programs with mouse
    killall # Kill programs
  ];
}
