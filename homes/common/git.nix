{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Evelyne";
    userEmail = "retroevelyne@outlook.com";
    signing = {
      key = "C4F179337DB0D43A2ABE8EC900FC03E8D01EA976";
      signByDefault = true;
      gpgPath = "gpg2";
    };

    aliases = {
      graph = "log --graph --oneline --decorate";
      unstage = "reset HEAD --";
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      ps = "push";
    };

    extraConfig = {
      init.defaultBranch = "development";
      pull.rebase = "merges";
    };

    ignores = [
      "**/.DS_Store"
      "**/._.DS_Store"
      ".DS_Store"
      "._.DS_Store"
      "**/*.swp"
      "*.swp"
    ];
  };
}
