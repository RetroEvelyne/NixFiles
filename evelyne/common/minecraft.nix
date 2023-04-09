{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher # Minecraft launcher
    minecraft # Actual minecraft
    jdk # Needed for running minecraft servers
  ];
}
