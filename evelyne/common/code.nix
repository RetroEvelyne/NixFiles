{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python3Full # Python
    go # Go
  ];
}
