{
  config,
  pkgs,
  lib,
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
        email = "barkbarkbark@yari.dog";
      };
      init.defaultBranch = "main";
    };
  };
  programs.mpv.enable = true;

  services.trayscale.enable = true;
  services.gnome-keyring.enable = true;

  # services.minecraft-server.enable = true;

  home.packages = with pkgs; [
    neovim
    ripgrep
    gcc
    cargo
    hyfetch
    btop
    bat
    unzip
    foot
    lua-language-server
    legcord
    prismlauncher
    ghidra
    gruvbox-dark-gtk
  ];

  stylix.targets.neovim.enable = false;
  stylix.targets.starship.enable = false;
  stylix.targets.gtk.enable = false;
  # stylix.targets.mako.enable = false;

  # stylix = {
  #   enable = true;
  #   autoEnable = false;
  #   base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  #   # image = ../../wallpapers/bg.png;
  #   polarity = "dark";
  #   cursor = {
  #     package = pkgs.capitaine-cursors-themed;
  #     name = "Capitaine Cursors (Gruvbox)";
  #     size = 32;
  #   };
  #   enableReleaseChecks = false;
  # };

  # home.pointerCursor = {
  #   package = pkgs.simp1e-cursors;
  #   name = "Simp1e-Gruvbox-Dark";
  #   size = 18;
  #   gtk.enable = true;
  #   x11.enable = true;
  # };
  #
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
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "gruvbox-dark";
      color-scheme = lib.mkIf true "prefer-dark";
    };
  };

  services.udiskie = {
    enable = true;
  };

  imports = [ ../config/default.nix ];
  # For Monado:
  xdg.configFile."openxr/1/active_runtime.json".source =
    "${pkgs.monado}/share/openxr/1/openxr_monado.json";

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "${config.xdg.dataHome}/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "${config.xdg.dataHome}/Steam/logs"
      ],
      "runtime" :
      [
        "${pkgs.opencomposite}/lib/opencomposite"
      ],
      "version" : 1
    }
  '';
}
