{ config, pkgs, username, ... }:

{
  # SSH
  programs.ssh = {
    enable = true;
    matchBlocks = {
      lambda = {
        identityFile = "~/.ssh/id_ed25519";
        hostname = "home.spyhoodle.me";
        user = "evelyne";
      };
    };
  };
}
