{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    nixos-xivlauncher-rb.url = "github:The1Penguin/nixos-xivlauncher-rb";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    stylix.url = "github:nix-community/stylix";
    nixvim.url = "github:nix-community/nixvim";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    tidaLuna.url = "github:Inrixia/TidaLuna";
    wayland-pipewire-idle-inhibit.url = "github:rafaelrc7/wayland-pipewire-idle-inhibit";
    cosmic-ext-alternative-startup = {
      url = "github:Drakulix/cosmic-ext-alternative-startup";
      flake = false;
    };

    cosmic-ext-extra-sessions = {
      url = "github:Drakulix/cosmic-ext-extra-sessions";
      flake = false;
    };
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
      wayland-pipewire-idle-inhibit,
      cosmic-ext-alternative-startup,
      cosmic-ext-extra-sessions,
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
            wayland-pipewire-idle-inhibit
            ;
        }
      );
    };
}
