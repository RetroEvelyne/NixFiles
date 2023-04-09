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
    "VM4321342" = {
      psk = "eabRnUdfrsw7mxdd";
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

