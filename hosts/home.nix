{ config, pkgs, ... }:

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

  services.trayscale.enable = true;

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
  ];

  home.pointerCursor = {
    package = pkgs.simp1e-cursors;
    name = "Simp1e-Gruvbox-Dark";
    size = 18;
    gtk.enable = true;
    x11.enable = true;
  };

  services.udiskie = { enable = true; };

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
