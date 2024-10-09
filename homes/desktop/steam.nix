{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    steam-run
  ];

  home.file.".local/bin/steam-killer" = {
    source = ./steam/steam-killer.sh;
    executable = true;
  };
}
