{ config, pkgs, username, ... }:

{
  users.users.${username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Evelyne";
    extraGroups = [ "adbusers" "dialout" "libvirtd" "plugdev" "i2c" ];
    openssh.authorizedKeys.keyFiles = [ ../../evelyne/common/ssh/id_ed25519.pub ];
  };
}
