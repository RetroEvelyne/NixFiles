{ config, ... }:

{
  virtualisation.libvirtd.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;
}
