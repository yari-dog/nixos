{ inputs, pkgs, ... }:

{
  programs.waybar = {
    enable = false;
    systemd = {
      enable = true;
      targets = [
        "graphical-session.target"
      ];
    };
  };

  home.file.".config/waybar".source = ./config;
}
