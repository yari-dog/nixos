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
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/*" = [ "feh.desktop" ];
        "video/*" = [ "mpv.desktop" ];
        "x-scheme-handler/http" = [ "zen.desktop" ];
        "x-scheme-handler/https" = [ "zen.desktop" ];
        "x-scheme-handler/steam" = [ "steam.desktop" ];
      };
      associations.removed = {
        "video/*" = [ "umpv.desktop" ];
        "audio/*" = [ "umpv.desktop" ];
        "image/*" = [
          "org.qutebrowser.qutebrowser.desktop"
          "helium.desktop"
          "gimp.desktop"
          "org.darktable.darktable.desktop"
        ];
        "application/zip" = [ "org.prismlauncher.PrismLauncher.desktop" ];
      };
    };
  };

  home.file.".local/share/applications" = {
    source = ./desktops/share;
    recursive = true;
  };
}
