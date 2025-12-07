{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";
    yazi.url = "github:sxyazi/yazi";
    nixos-xivlauncher-rb = {
      url = "github:The1Penguin/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-xr,
      home-manager,
      neovim-nightly-overlay,
      nixos-hardware,
      millennium,
      yazi,
      nixos-xivlauncher-rb,
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
            neovim-nightly-overlay
            millennium
            yazi
            nixos-xivlauncher-rb
            ;
        }
      );
    };
}
