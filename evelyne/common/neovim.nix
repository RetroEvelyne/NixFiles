{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nodejs
      sumneko-lua-language-server
      nodePackages.bash-language-server
      nodePackages.vim-language-server
      rust-analyzer
      universal-ctags
    ];
  };

  home.packages = with pkgs; [
    neovide
  ];

  xdg.configFile."nvim" = {
    source = ./neovim;
    recursive = true;
  };
}
