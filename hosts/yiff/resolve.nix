{
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ./resolve-build.nix { studioVariant = true; })
  ];
}
