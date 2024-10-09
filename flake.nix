{
  description = "Evelyne's NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix Darwin
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin }:
    let
      username = "evelyne";
      utils = import ./utils nixpkgs;

      nixpkgs_aarch64_darwin = import nixpkgs {
        config.allowUnfree = true;
        system = "aarch64-darwin";
      };

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
            home-manager.users.${username}.imports = utils.nixFilesIn ./homes/common;
            home-manager.extraSpecialArgs = { inherit username; pkgs = nixpkgs_x86_64; };
          }
        ] ++ utils.nixFilesIn ./systems/pogmachine;
      };

      darwinConfigurations."laptop" = nix-darwin.lib.darwinSystem {
        pkgs = nixpkgs_aarch64_darwin;
        system = "aarch64-darwin";
        specialArgs = {
          inherit username;
        };
        modules = [
          home-manager.darwinModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.${username}.imports = [ ] ++ utils.nixFilesIn ./homes/common ++ utils.nixFilesIn ./homes/laptop;
            home-manager.extraSpecialArgs = { inherit username; pkgs = nixpkgs_aarch64_darwin; };
          }
        ] ++ utils.nixFilesIn ./systems/laptop;
      };

      formatter.x86_64-linux = nixpkgs_x86_64.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}

