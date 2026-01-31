{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      # xdg-desktop-portal-termfilechooser
    ];
    xdgOpenUsePortal = true;

    config.common.default = "*";
    #   "default" = "gtk";
    #   "org.freedesktop.impl.portal.ScreenCast" = "gnome";
    # };
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "foot.desktop"
      ];
    };
  };
  #
  home.sessionVariables.TERM = "foot";
  home.sessionVariables.TERMCMD = "foot";
  home.sessionVariables.TERMINAL = "foot";
  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
}
