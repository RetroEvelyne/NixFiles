{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    ripgrep
    fd
  ];
}
