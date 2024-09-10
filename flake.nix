{
  description = "Evelyne's NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      username = "retro";
      utils = import ./utils nixpkgs;

      nixpkgs_x86_64 = import nixpkgs {
        config.allowUnfree = true;
        config.allowUnsupportedSystem = false;
        config.allowBroken = false;
        overlays = import ./overlays.nix;
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations."PogMachine" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit username; };
        pkgs = nixpkgs_x86_64;
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.users.${username}.imports = utils.nixFilesIn ./evelyne/common;
            home-manager.extraSpecialArgs = { inherit username; pkgs = nixpkgs_x86_64; };
          }
        ] ++ utils.nixFilesIn ./systems/pogmachine;
      };

      formatter.x86_64-linux = nixpkgs_x86_64.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}

