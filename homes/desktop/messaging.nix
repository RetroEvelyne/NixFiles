{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    element-desktop # Matrix client
    signal-desktop # Signal client
    discord-canary # Discord client
    ripcord # Better discord client
    nheko # Better matrix client
  ];
}
