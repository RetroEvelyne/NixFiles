{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    nerdfonts
    font-awesome
    source-han-sans
    source-han-serif
    source-han-code-jp
  ];
}
