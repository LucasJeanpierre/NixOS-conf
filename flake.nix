{
  description = "Ma config NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    asus-numberpad-driver = {
      url = "github:asus-linux-drivers/asus-numberpad-driver";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, asus-numberpad-driver, ... }@inputs:
  let
    mkSystem = extraModules: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./modules/dev.nix
        ./modules/shell.nix
        ./modules/wallpaper.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.zeta = {
            imports = [
              catppuccin.homeModules.catppuccin
              ./modules/home.nix
            ];
          };
        }
      ] ++ extraModules;
    };
  in {
    nixosConfigurations = {
      zenbook = mkSystem [ ./hosts/zenbook ];
    };
  };
}