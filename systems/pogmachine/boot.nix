{ config, pkgs, ... }:

{
  # Set up bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Use the linux-zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Enable i2c
  boot.kernelModules = [ "i2c-dev" ];
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
}
