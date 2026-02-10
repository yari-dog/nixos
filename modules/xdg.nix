{ pkgs, lib, ... }:
{
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
