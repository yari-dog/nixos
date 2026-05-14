{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    nixos-xivlauncher-rb = {
      url = "github:The1Penguin/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium.url = "github:FKouhai/helium2nix/main";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    tidaLuna.url = "github:Inrixia/TidaLuna";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-xr,
      home-manager,
      nixos-hardware,
      nixos-xivlauncher-rb,
      helium,
      zen-browser,
      stylix,
      nixvim,
      nix-flatpak,
      tidaLuna,
    }:
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit
            inputs
            nixpkgs
            nixpkgs-xr
            home-manager
            nixos-hardware
            nixos-xivlauncher-rb
            helium
            zen-browser
            stylix
            nixvim
            nix-flatpak
            tidaLuna
            ;
        }
      );
    };
}
