{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    cool-retro-term # Retro-style terminal
    kitty # Used for testing
    st # Suckless terminal
  ];
}
