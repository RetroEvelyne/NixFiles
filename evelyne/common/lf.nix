{ config, pkgs, ... }:

{
  programs.lf = {
    enable = true;
    previewer.source = ./lf/scope;
    settings = {
      relativenumber = true;
      number = true;
      hidden = false;
      preview = true;
      icons = true;
    };
  };

  xdg.configFile = {
    "lf/icons" = {
      source = ./lf/icons;
    };
  };

  home.packages = with pkgs; [
    ueberzug
    file
  ];
}
