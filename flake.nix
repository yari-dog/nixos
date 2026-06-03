{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    nixos-xivlauncher-rb.url = "github:The1Penguin/nixos-xivlauncher-rb";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    stylix.url = "github:nix-community/stylix/pull/2337/head";
    nixvim.url = "github:nix-community/nixvim";
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
