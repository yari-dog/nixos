{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./waybar
    ./qutebrowser
    ./rofi
    ./shell
    ./mako
    ./font
    ./niri
    ./nvim
    ./yazi
    ./environment
  ];

  # pkgs.config.chromium.enableWideVine = true;
  home.username = "yari";
  home.homeDirectory = "/home/yari";
  home.stateVersion = "26.05";
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yari :3";
        email = "yari@woofwoofwoof.net";
      };
      init.defaultBranch = "main";
    };
  };
  programs.mpv.enable = true;
  programs.discord.enable = true;

  services.trayscale.enable = true;
  services.gnome-keyring.enable = true;
  home.packages = with pkgs; [
    hyfetch
    foot
    lua-language-server
    prismlauncher
    gruvbox-dark-gtk
    qbittorrent
    inputs.helium.defaultPackage.${stdenv.hostPlatform.system}
    lutris
    qpwgraph
    inputs.tidaLuna.packages.${stdenv.hostPlatform.system}.default
  ];

  programs.anki = {
    enable = true;
    sync.username = "yari_dog@protonmail.com";
    sync.keyFile = config.lib.file.mkOutOfStoreSymlink "/home/yari/.ankisecret";
  };

  programs.irssi.enable = true;

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
}
