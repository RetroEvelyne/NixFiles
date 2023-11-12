{ config, pkgs, ... }:

let
  packages = ps: with ps; [
    pygame
    tkinter
    pymunk
    pillow
    psycopg2
    passlib
    argon2_cffi
    python-dotenv
    python-lsp-server
  ];
in
{
  home.packages = [
    (pkgs.python311.withPackages packages)
  ];
}
