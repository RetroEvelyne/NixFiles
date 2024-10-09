{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher # Minecraft launcher
    jdk # Needed for running minecraft servers
  ];
}
