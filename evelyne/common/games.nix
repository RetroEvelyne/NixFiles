{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gzdoom # Modern doom runner
    pcsx2 # PS2 Emulator
  ];
}
