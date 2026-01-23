{
  inputs,
  nixpkgs,
  nixpkgs-xr,
  home-manager,
  nixos-hardware,
  nixos-xivlauncher-rb,
  stylix,
  nix-flatpak,
  ...
}:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  yiff = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system;
      host = {
        hostName = "yiff";
      };
    };
    modules = [
      ./yiff
      ./configuration.nix
      nixpkgs-xr.nixosModules.nixpkgs-xr
      home-manager.nixosModules.home-manager
      nixos-xivlauncher-rb.nixosModules.default
      stylix.nixosModules.stylix
      nix-flatpak.nixosModules.nix-flatpak
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.yari = import ./home.nix;
          backupFileExtension = "backup";
          extraSpecialArgs = {
            inherit inputs;
            host = "yiff";
          };
        };
      }
    ];
  };
  yifftop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system;
      host = {
        hostName = "yifftop";
      };
    };
    modules = [
      ./legion
      ./configuration.nix
      nixos-hardware.nixosModules.lenovo-legion-15ach6h-hybrid
      nixpkgs-xr.nixosModules.nixpkgs-xr
      home-manager.nixosModules.home-manager
      nixos-xivlauncher-rb.nixosModules.default
      stylix.nixosModules.stylix
      nix-flatpak.nixosModules.nix-flatpak
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.yari = import ./home.nix;
          backupFileExtension = "backup";
          extraSpecialArgs = {
            inherit inputs;
            host = "yifftop";
          };
        };
      }
    ];
  };
  yiffpad = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system;
      host = {
        hostName = "yiffpad";
      };
    };
    modules = [
      ./t420s
      ./configuration.nix
      nixos-hardware.nixosModules.lenovo-thinkpad-t420
      nixpkgs-xr.nixosModules.nixpkgs-xr
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      nix-flatpak.nixosModules.nix-flatpak
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.yari = import ./home.nix;
          backupFileExtension = "backup";
          extraSpecialArgs = {
            inherit inputs;
            host = "yiffpad";
          };
        };
      }
    ];
  };
}
