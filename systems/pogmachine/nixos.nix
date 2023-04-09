{ config, lib, ... }:

{
  system.stateVersion = "22.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
