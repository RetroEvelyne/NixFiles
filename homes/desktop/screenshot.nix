{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tesseract5 # Gets text from images
    maim # X11 screenshot tool
  ];

  home.file.".local/bin/sss" = {
    source = ./screenshot/sss.sh;
    executable = true;
  };
}
