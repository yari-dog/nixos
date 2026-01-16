{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  home.username = "yari";
  home.homeDirectory = "/home/yari";
  home.stateVersion = "25.11";
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yari :3";
        email = "yari_dog@protonmail.com";
      };
      init.defaultBranch = "main";
    };
  };
  programs.mpv.enable = true;

  services.trayscale.enable = true;
  services.gnome-keyring.enable = true;

  # services.minecraft-server.enable = true;

  home.packages = with pkgs; [
    hyfetch
    foot
    lua-language-server
    legcord
    prismlauncher
    gruvbox-dark-gtk
    qbittorrent
    (xivlauncher-rb.override { useGameMode = true; })
    inputs.helium.defaultPackage.${stdenv.hostPlatform.system}
    lutris
  ];

  programs.anki = {
    enable = true;
    sync.username = "yari_dog@protonmail.com";
    sync.keyFile = config.lib.file.mkOutOfStoreSymlink "/home/yari/.ankisecret";
  };

  stylix.targets.neovim.enable = false;
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
  #
  # # gtk 4
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     gtk-theme = "gruvbox-dark";
  #     color-scheme = lib.mkIf true "prefer-dark";
  #   };
  # };

  services.udiskie = {
    enable = true;
  };

  imports = [ ../config ];
  # For Monado:
  # xdg.configFile."openxr/1/active_runtime.json".source =
  #   "${pkgs.monado}/share/openxr/1/openxr_monado.json";
  #
  # xdg.configFile."openvr/openvrpaths.vrpath".text = ''
  #   {
  #     "config" :
  #     [
  #       "${config.xdg.dataHome}/Steam/config"
  #     ],
  #     "external_drivers" : null,
  #     "jsonid" : "vrpathreg",
  #     "log" :
  #     [
  #       "${config.xdg.dataHome}/Steam/logs"
  #     ],
  #     "runtime" :
  #     [
  #       "${pkgs.opencomposite}/lib/opencomposite"
  #     ],
  #     "version" : 1
  #   }
  # '';
}
