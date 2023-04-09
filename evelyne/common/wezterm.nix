{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = 'OneDark (base16)',
        hide_tab_bar_if_only_one_tab = true,
        window_close_confirmation = 'NeverPrompt'
      }
    '';
  };
}
