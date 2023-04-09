{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tabbed
  ];

  home.file.".local/bin/tabbed" = {
    source = ./tabbed;
    executable = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin/tabbed"
  ];
}
