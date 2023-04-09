{ config, pkgs, ... }:

{
  # Set up bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Use the linux-zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
