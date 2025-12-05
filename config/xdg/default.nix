{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-termfilechooser
    ];
    xdgOpenUsePortal = true;

    config.common = {
      "default" = "gtk";
      "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "foot.desktop"
      ];
    };
  };

  home.sessionVariables.TERMCMD = "foot";
  home.sessionVariables.TERMINAL = "foot";

  xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
    force = true;
    text = ''
      [filechooser]
      cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
    '';
  };

}
