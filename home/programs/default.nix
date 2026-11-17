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
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      sponsorblock
      cut
    ];
    config = {
      keep-open = "yes";
      hwdec = "auto";
    };
  };

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
        FakeNitro.enabled = true;
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
    lutris
    whatsapp-electron
    darktable
    qpwgraph
    digikam
    obs-cmd
    concord-tui
  ];
}
