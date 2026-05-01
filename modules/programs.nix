{ pkgs, host, ... }:
{
  programs.nh = {
    enable = true;
  };

  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  programs.thunar.enable = true;

  programs.dconf.enable = true;
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    # image = ../../wallpapers/bg.png;
    polarity = "dark";
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 18;
    };
    fonts = {
      serif.name = "Sarasa Term J Nerd Font";
      sansSerif.name = "Sarasa Term J Nerd Font";
      monospace.name = "Sarasa Term J Nerd Font";
    };
    icons = {
      package = pkgs.gruvbox-dark-icons-gtk;
      dark = "oomox-gruvbox-dark";
      light = "oomox-gruvbox-dark";
      enable = true;
    };
    enableReleaseChecks = false;
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };

      # Warning: GPU optimisations have the potential to damage hardware
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1;
        amd_performance_level = "high";
      };

      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };

  programs.niri.enable = true;

  programs.fish = {
    enable = true;

    shellAliases = {
      ns = "nh os switch ~/nix -H ${host.hostName}";
      gg = "cd ../";
      htop = "btop";
      cat = "bat";
      fuck = "f";
      nix-shell = "nix-shell --command fish";
    };

    interactiveShellInit = ''
      set fish_greeting
        function last_history_item
            echo $history[1]
        end
        abbr -a !! --position anywhere --function last_history_item
    '';
  };

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    git
    wget
    jq
    wl-clipboard
    wl-clip-persist
    nodejs
    lshw
    pciutils

    ripgrep
    gcc
    cargo
    btop
    bat
    unzip
    # lsp

    wayland-scanner
    wayland-protocols
    wayland-utils
    wayland

    rustc
    gnumake

    perf
    gdb

    xdg-utils
    python3
    # other
    # bitwarden-desktop
    # bitwarden-cli
    # bitwarden-menu

    vial
    qmk
    dos2unix
    pkgsCross.avr.buildPackages.gcc

    wineWow64Packages.stable
    winetricks
    pwvucontrol
    telegram-desktop

    # for qute autofil
    # keyutils

    # libimobiledevice
    # ifuse
    remmina
    p7zip
    distrobox

    kdiskmark

    freerdp

    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fzf
    fishPlugins.grc
    grc

    piper

    widevine-cdm
    ffmpeg
    feh
    nvtopPackages.full
    libva-utils
    kdePackages.kdenlive
    libnotify
    gnome-software
    fastfetch
    macchina

    ghidra-bin
    audacity
    patchelf
  ];
}
