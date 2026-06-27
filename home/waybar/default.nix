{ inputs, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      targets = [
        "graphical-session.target"
      ];
    };
  };

  home.file.".config/waybar".source = ./config;
}
