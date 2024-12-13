{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    hyprsome.url = "github:sopa0/hyprsome";
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, ... }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
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
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };

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
