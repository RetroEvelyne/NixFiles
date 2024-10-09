{ config, ... }:

{
  programs.eza = {
    enable = true;
    extraOptions = [
      "--group-directories-first"
      "--time-style=long-iso"
      "--git"
      "-h"
    ];
    icons = true;
  };
}
