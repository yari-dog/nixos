{
  pkgs,
  ...
}:

{
  imports = [
    ./environment
    ./font
    ./mako
    ./niri
    ./nvim
    ./programs
    ./qutebrowser
    ./rofi
    ./shell
    ./waybar
    ./xdg
    ./yazi
    ./zen-browser
  ];

  home.username = "yari";
  home.homeDirectory = "/home/yari";
  home.stateVersion = "26.05";

  services.easyeffects.enable = true;

  services.trayscale.enable = true;
  services.gnome-keyring.enable = true;

  stylix.targets.starship.enable = false;
  stylix.targets.gtk.enable = false;
  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-font-name = "Sarasa Term J Nerd Font";
        gtk-cursor-theme-size = 18;
        gtk-toolbar-style = 3;
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_SMALL_TOOLBAR";
        gtk-button-images = 0;
        gtk-menu-images = 0;
        gtk-enable-event-sounds = 1;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
        gtk-decoration-layout = "icon:minimize,maximize,close";
        gtk-enable-animations = true;
        gtk-modules = "colorreload-gtk-module";
        gtk-primary-button-warps-slider = true;
        gtk-sound-theme-name = "ocean";
        gtk-xft-dpi = 98304;
      };
    };
  };

  services.udiskie = {
    enable = true;
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
