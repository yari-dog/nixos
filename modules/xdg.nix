{ pkgs, lib, ... }:
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "image/*" = [ "feh.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "x-scheme-handler/http" = [ "helium.desktop" ];
      "x-scheme-handler/https" = [ "helium.desktop" ];
      # if steam links arent opening my current fix is that x-scheme-handler/steam needs to be in .local/share/applications/mimelist.cache for some reason. no fucking idea why
    };
    removedAssociations = {
      "video/*" = [ "umpv.desktop" ];
      "audio/*" = [ "umpv.desktop" ];
      "image/*" = [
        "org.qutebrowser.qutebrowser.desktop"
        "helium.desktop"
      ];
      "application/zip" = [ "org.prismlauncher.PrismLauncher.desktop" ];
    };
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;

    config.common.default = "*";
    config.niri.default = lib.mkDefault "*";
  };
}
