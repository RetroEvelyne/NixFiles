{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libheif # Manage .heif files from phones
    gcolor2 # Color viewer and eyedropper
    ffmpeg # Video manipulator
  ];
}
