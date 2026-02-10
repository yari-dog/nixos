{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../kanata.nix
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  environment.systemPackages = with pkgs; [ reaper ];
  console.useXkbConfig = true;

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
}
