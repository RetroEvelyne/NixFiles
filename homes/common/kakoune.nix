{ config, pkgs, ... }:

{
  programs.kakoune = {
    enable = true;
    config = {
      numberLines = {
        enable = true;
        relative = true;
      };
      scrollOff.lines = 3;
      showWhitespace.enable = true;
      tabStop = 4;
      ui = {
        assistant = "cat";
        enableMouse = true;
      };
    };
    plugins = with pkgs.kakounePlugins; [
      kakoune-rainbow
      powerline-kak
      auto-pairs-kak
    ];
  };
}
