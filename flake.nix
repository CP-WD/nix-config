{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

<<<<<<< HEAD
    xremap.url = "github:xremap/nix-flake";
  };

  outputs = inputs@{ nixpkgs, flake-utils, home-manager, hyprland, xremap, ... }:
  {
=======
    # xremap.url = "github:xremap/nix-flake";
  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, ... }: {
>>>>>>> parent of 7b78c15 (awesome前)
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

            # TODO replace ryan with your own username
            home-manager.users.gavagai = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
        ];
        specialArgs = {
          inherit inputs; # `inputs = inputs;`と等しい
        };
      };
    };
  };
}
