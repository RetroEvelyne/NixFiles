{ config, pkgs, username, ... }:

{
  # SSH
  programs.ssh = {
    enable = true;
  };
}
