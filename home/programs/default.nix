{ inputs, pkgs, ... }:

{
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

  programs.vesktop = {
    enable = true;

    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = true;
      notifyAboutUpdates = true;

      plugins = {
        ClearURLs.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        VolumeBooster.enabled = true;
        AnonymiseFileNames.enabled = true;
        YoutubeAdblock.enabled = true;
      };
    };
  };

  # programs.anki = {
  #   enable = true;
  #   profiles."User 1" = {
  #     sync.username = "yari_dog@protonmail.com";
  #     sync.keyFile = config.lib.file.mkOutOfStoreSymlink "/home/yari/.ankisecret";
  #   };
  # };

  programs.irssi.enable = true;

  home.packages = with pkgs; [
    hyfetch
    foot
    lua-language-server
    prismlauncher
    gruvbox-dark-gtk
    qbittorrent
    # TODO: switch back to old one when openldap gets fixed
    # lutris
    (pkgs.lutris.override {
      # Intercept buildFHSEnv to modify target packages
      buildFHSEnv =
        args:
        pkgs.buildFHSEnv (
          args
          // {
            multiPkgs =
              envPkgs:
              let
                # Fetch original package list
                originalPkgs = args.multiPkgs envPkgs;

                # Disable tests for openldap
                customLdap = envPkgs.openldap.overrideAttrs (_: {
                  doCheck = false;
                });
              in
              # Replace broken openldap with the custom one
              builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [ customLdap ];
          }
        );
    })
    whatsapp-electron
    darktable
    qpwgraph
    inputs.tidaLuna.packages.${stdenv.hostPlatform.system}.default
  ];
}
