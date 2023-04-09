{ config, ... }:

{
  programs.exa = {
    enable = true;
    enableAliases = true;
    extraOptions = [
      "--group-directories-first"
      "--time-style=long-iso"
      "--git"
      "-h"
    ];
    icons = true;
  };
}
