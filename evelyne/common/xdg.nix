{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg = {
    enable = true;
    userDirs.enable = true;
    desktopEntries = {
      "browser" = {
        name = "Web Browser";
        type = "Application";
        exec = "${pkgs.librewolf}/bin/librewolf %f";
      };
      "image" = {
        name = "Image Viewer";
        type = "Application";
        exec = "${pkgs.nsxiv}/bin/nsxiv -a %f";
      };
      "text" = {
        name = "Text Editor";
        type = "Application";
        exec = "${pkgs.st}/bin/st -e ${pkgs.neovim}/bin/nvim %u";
      };
      "pdf" = {
        name = "PDF Reader";
        type = "Application";
        exec = "${pkgs.zathura}/bin/zathura %u";
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "pdf.desktop";
        "x-scheme-handler/http" = "browser.desktop";
        "x-scheme-handler/https" = "browser.desktop";
        "image/png" = "image.desktop";
        "image/jpeg" = "image.desktop";
        "image/jpg" = "image.desktop";
        "image/gif" = "image.desktop";
        "video/mp4" = "mpv.desktop";
        "text/plain" = "text.desktop";
        "text/html" = "browser.desktop";
      };
    };
  };

  home = {
    sessionVariables = {
      # Force use of XDG Dir Spec
      CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
      LESSHISTFILE = "${config.xdg.configHome}/less/history";
      LESSKEY = "${config.xdg.configHome}/less/keys";
      WINEPREFIX = "${config.xdg.dataHome}/wine";
      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";

      # Default programs
      EDITOR = "nvim";
      TERMINAL = "st";
      BROWSER = "librewolf";
    };

    shellAliases = {
      # Force use of XDG Dir Spec
      wget = "wget --hsts-file='${config.xdg.dataHome}/wget-hsts'";
      rxrdb = "xrdb -load '${config.xdg.configHome}/.config/X11/xresources'";
      nvidia-settings = "nvidia-settings --config='${config.xdg.configHome}'/nvidia/settings";
    };
  };
}
