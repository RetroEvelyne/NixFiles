{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ncdu_2 # Disk space manager
    clifm # TUI file manager
  ];
}
