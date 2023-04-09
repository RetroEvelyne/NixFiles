{ config, ... }:

{
  services.pass-secret-service = {
    enable = true;
    storePath = "${config.xdg.dataHome}/password-store";
  };
}
