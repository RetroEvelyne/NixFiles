{ config, pkgs, ... }:

{
  services.xserver = {
    # Enable X11 windowing system
    enable = true;

    # Set gb X11 keymap
    layout = "gb";
    xkbOptions = "eurosign:e";

    # Use startx for starting window managers
    displayManager = {
      startx.enable = true;
    };
  };
}
