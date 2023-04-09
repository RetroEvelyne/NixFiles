{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    font = {
      package = pkgs.iosevka;
      name = "Iosevka";
      size = 10;
    };
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin-Frappe-Standard-Blue-Dark";
    };
    iconTheme = {
      package = pkgs.zafiro-icons;
      name = "Zafiro-icons-Dark";
    };
  };

  home.packages = with pkgs; [
    gnome.zenity
  ];
}
