{
  host,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # xwayland-satellite
    (pkgs.callPackage ./xwayland-sattelite.nix { })
    playerctl
  ];

  home.file.".config/niri/host".source = ./config/${host};
  home.file.".config/niri/config.kdl".source = ./config/config.kdl;
  home.file.".config/niri/base" = {
    source = ./config/base;
    recursive = true;
  };
  home.file.".config/niri/vim-niri-nav".source = ./config/vim-niri-nav;
}
