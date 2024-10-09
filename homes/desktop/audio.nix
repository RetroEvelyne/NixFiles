{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pulsemixer # TUI sound mixer
    pamixer # CLI sound mixer
    playerctl # Manages media players
    cava # Music visualiser
  ];

  home.file.".local/bin/ytdlp-music" = {
    source = ./audio/ytdlp-music.sh;
    executable = true;
  };
}
