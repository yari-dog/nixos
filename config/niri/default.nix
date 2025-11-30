{ inputs, pkgs, host, ... }:

{
  home.packages = with pkgs; [ xwayland-satellite alacritty ];

  # home.file."${host}".source = ./config/${host};
  home.file.".config/niri".source = ./config;
  home.file.".local/bin/vim-niri-nav".source = ./config/vim-niri-nav;
}
