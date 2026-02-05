{
  pkgs,
  lib,
  ...
}:

{
  services.flatpak = {
    enable = true;
    packages = [
      "com.valvesoftware.Steam"
      "com.github.tchx84.Flatseal"
    ];
    uninstallUnmanaged = true;
    overrides = {
      "com.valvesoftware.Steam".Context = lib.mkDefault {
        filesystems = lib.mkDefault [
          "xdg-pictures:rw"
          "xdg-videos:rw"
          "~/steam-data"
          "!home"
        ];
        sockets = lib.mkDefault [
          "session-bus"
          "system-bus"
          "inherit-wayland-socket"
        ];
      };
      "global".Context.filesystems = lib.mkDefault [
        "~/nix/config/font/fonts"
        # "/nix/store/*home-manager-files" # idk if this actually works or not lmao
      ];
    };
    update.onActivation = true;
  };
}
