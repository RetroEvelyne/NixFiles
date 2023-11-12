{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    # Use the zsh shell
    enable = true;

    # Basic config settings
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    /* defaultKeymap = "vicmd"; */
    dotDir = ".config/zsh";
    history = {
      size = 9999999;
      expireDuplicatesFirst = true;
      extended = true;
      path = "${config.xdg.cacheHome}/zsh/history";
    };

    # Zsh init extras
    initExtra = ''
      # Disable Ctrl-S to freeze terminal
      stty stop undef

      # Tab completion
      zstyle ':completion:*' menu select # Use a menu
      _comp_options+=(globdots)          # Include hidden files

      # Change cursor shape for different vi modes
      export KEYTIMEOUT=1
      function zle-keymap-select () {
          case $KEYMAP in
              vicmd) echo -ne '\e[1 q';;      # block
              viins|main) echo -ne '\e[5 q';; # beam
          esac
      }
      zle -N zle-keymap-select
      zle-line-init() {
          zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
          echo -ne "\e[5 q"
      }
      zle -N zle-line-init
      echo -ne '\e[5 q' # Use beam shape cursor on startup.
      preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
    '';
  };

  programs.starship = {
    # Use the starship prompt
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = lib.concatStrings [
        # Directory
        "$directory"

        # VCS
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$hg_branch"

        # Languages
        "$package"
        "$c"
        "$rust"
        "$golang"
        "$haskell"
        "$python"
        "$java"
        "$kotlin"
        "$lua"
        "$dart"
        "$nim"
        "$nodejs"
        "$swift"
        "$zig"
        "$nix_shell"
        "$conda"
        "$spack"

        # Prompt line
        "$line_break"
        "$username"
        "$hostname"
        "$localip"
        "$cmd_duration"
        "$memory_usage"
        "$jobs"
        "$character"
      ];

      # Prompt character
      character = {
        success_symbol = "-> [](bold purple)";
        error_symbol = "-> [](bold red)";
        vimcmd_symbol = "-> [](bold green)";
      };

      # When in a deep directory or git repo
      directory.truncation_symbol = ".../";

      # Git widgets
      git_metrics.disabled = false;
      git_status = {
        ahead = "->";
        behind = "<-";
        diverged = "<->";
        renamed = ">>";
        deleted = "x";
      };

      # Enable other starship widgets
      memory_usage.disabled = false;
      localip.disabled = false;
    };
  };
}
