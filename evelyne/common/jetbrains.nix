{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.clion
    jetbrains.goland
    jetbrains.webstorm
    jetbrains.pycharm-professional
  ];
}
