{ config, pkgs, username, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    extraConfig = ''
      auto_update "yes"

      audio_output {
        type            "pipewire"
        name            "PipeWire Sound Server"
      }

      audio_output {
        type	"fifo"
        name	"Visualizer feed"
        path	"/tmp/mpd.fifo"
        format	"44100:16:2"
      }
    '';
  };

  home.packages = with pkgs; [
    mpc_cli
  ];

  programs.ncmpcpp = {
    enable = true;
    settings = {
      ncmpcpp_directory = "${config.home.homeDirectory}/.local/share/ncmpcpp";
      lyrics_directory = "${config.home.homeDirectory}/.local/share/lyrics";
    };
  };
}
