{ config, ... }:

{
  programs.zsh.initExtra = ''
    precmd() { [ $? -ne 0 ] && $HOME/.local/bin/mommy -n }
  '';

  home.file.".local/bin/mommy" = {
    source = ./mommy/shell-mommy.sh;
    executable = true;
  };
}
