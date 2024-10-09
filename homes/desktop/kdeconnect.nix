{ config, ... }:

{
  services.kdeconnect.enable = true;

  home.file.".xinitrc".text = ''
    # Start kdeconnect when entering a graphical session
    systemctl restart --user kdeconnect &
  '';
}
