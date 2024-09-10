{ config, lib, ... }:

{
  # DHCP
  networking.useDHCP = lib.mkDefault true;

  # Hostname
  networking.hostName = "PogMachine";

  # Enable wireless support & configuration
  networking.wireless.enable = true;
  networking.wireless.networks = {
    # Home router
    "SKYHZDH2" = {
      psk = "aFTEGPD6YFsUe8";
    };
    # Mum's phone
    "HUAWEI P smart 2019" = {
      psk = "aaaaaaaa";
    };
    # Personal phone
    "PogPhone" = {
      psk = "password";
    };
  };
}

