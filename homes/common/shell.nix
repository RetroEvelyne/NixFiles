{ config, ... }:

{
  home = {
    # Aliases
    shellAliases = {
      # Core Programs
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -vI";
      mkd = "mkdir -pv";
      c = "clear";
      e = "exit";

      # CLI Shortcuts
      v = "nvim";
      vi = "nvim";
      ka = "killall";
      xw = "xwallpaper";
      nf = "neofetch";
      gf = "pridefetch -f genderfluid";
      pf = "pfetch";
      i = "inertia";

      # System shortcuts
      heif-convert-dir = "for file in *.heic; do heif-convert -q 100 $file \${file/%.heic/.jpg}; done";
      unfuck-wifi = "doas systemctl restart wpa_supplicant.service";
      cdt = "cd $(mktemp -d)";
      sx = "startx ~/.config/x11/xinitrc";
      sdn = "doas shutdown -h now";
      kys = "kill $(pidof '$@')";
      nheko = "systemctl restart --user pass-secret-service.service && nheko";

      # Nix system shortucts
      nix-system-update = "nix flake update $NIXFILES && doas nixos-rebuild switch --flake $NIXFILES";

      # For colour
      btop = "btop --utf-force";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
    };

    # Environment variables
    sessionVariables = {
      # Locale
      LANG = "en_GB.UTF-8";
      LC_ALL = "en_GB.UTF-8";

      # Define nixfiles location
      NIXFILES = "$HOME/Development/Personal/NixFiles";

      # Java windows
      _JAVA_AWT_WM_NONREPARENTING = 1;
    };

    # Default $PATH
    sessionPath = [
      # Add ~/.local/bin to $PATH
      "$HOME/.local/bin"
    ];
  };
}
