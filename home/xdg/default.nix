{ lib, ... }:
{
  xdg = {
    enable = true;
    terminal-exec = {
      enable = true;
      settings.default = [ "foot.desktop" ];
    };
    autostart = {
      enable = true;
      entries = [
        "${./desktops/autostart/bitwarden.desktop}"
        "${./desktops/autostart/steam.desktop}"
        "${./desktops/autostart/vesktop.desktop}"
      ];
    };
  };

  home.file.".local/share/applications" = {
    source = ./desktops/share;
    recursive = true;
  };
}
