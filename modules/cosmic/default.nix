{ pkgs, lib, ... }:
{
  imports = [
    ./cosmic-ext-alternative-startup.nix
    ./cosmic-ext-extra-sessions.nix
  ];

  services.desktopManager.cosmic.enable = true;
}
