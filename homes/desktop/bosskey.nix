{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    slock
  ];

  home.file.".local/bin/bosskey" = {
    source = ./bosskey/bosskey.sh;
    executable = true;
  };
}
