{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dwm # Suckless dynamic window manager
  ];
}
