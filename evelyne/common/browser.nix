{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf
    amfora
    lynx
  ];
}
