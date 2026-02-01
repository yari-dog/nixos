{ lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/kanata.nix
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };
  console.useXkbConfig = true;
}
