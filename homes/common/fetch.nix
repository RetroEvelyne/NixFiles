{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pridefetch # System stats with pride flags
    neofetch # Generic system stats
    pfetch # Simple system stats
  ];
}
