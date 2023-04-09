{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    texlive.combined.scheme-full # LaTeX
    libreoffice # Documents suite
    thunderbird # Email client
    obsidian # Notes app
    sc-im # TUI spreadsheet
    anki # Flashcard app
  ];
}
