{ config, pkgs, ... }:

{
  home.file.".xinitrc".text = ''
    # Import xorg environment into systemd for the picom service to work
    systemctl --user import-environment XAUTHORITY DISPLAY &

    # Restart picom after importing the xorg environment
    systemctl --user restart picom &
  '';
  services.picom = {
    enable = true;
    fade = true;
    fadeSteps = [
      0.1
      0.1
    ];
    opacityRules = [
      "90:class_g = 'st-256color'"
      "90:class_g = 'tabbed-trans'"
    ];
    shadow = true;
    vSync = true;
  };
}
