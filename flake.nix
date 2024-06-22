{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap.url = "github:xremap/nix-flake";
  };

  outputs = inputs@{ nixpkgs, flake-utils, home-manager, hyprland, xremap, ... }: 
  {
    nixosConfigurations = {
      myNixOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          hyprland.nixosModules.default
          {programs.hyprland.enable = true;}

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gavagai = import ./home.nix;
          }
        ];
        specialArgs = {
          inherit inputs; # `inputs = inputs;`と等しい
        };
      };
    };
  };
}
