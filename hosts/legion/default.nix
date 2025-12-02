{ lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ../kanata.nix ];

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  console.useXkbConfig = true;
}
