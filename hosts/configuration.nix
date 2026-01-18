# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  lib,
  pkgs,
  host,
  inputs,
  ...
}:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # hardware.amdgpu.initrd.enable = true;
  hardware.steam-hardware.enable = true;
  nixpkgs.config.allowUnfree = true;
  hardware.firmware = [ pkgs.linux-firmware ];

  console = {
    enable = true;
    earlySetup = true;
    useXkbConfig = true;
  };
  # services.kmscon.enable = true;
  # services.kmscon.extraOptions = "--mode=3440x1440 --gpus=primary";
  # services.kmscon.extraConfig = "font-name=Sarasa Term J Nerd Font";

  networking.hostName = host.hostName; # Define your hostname.

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    # "video=DP-1:3440x1440@75.050"
    # "video=HDMI-A-3:2560x1080@60"
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "nowatchdog"
    "nmi_watchdog=0"
  ];
  boot.loader.timeout = 0;
  # Use latest kernel.
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.plymouth.enable = true;

  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      max-jobs = "auto";
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
    };
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  # services.displayManager.ly.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.tailscale.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.udisks2.enable = true;

  services.gvfs.enable = true;

  services.flatpak = {
    enable = true;
    packages = [
      "com.valvesoftware.Steam"
    ];
  };

  # systemd.services.flatpak-repo = {
  #   wantedBy = [ "multi-user.target" ];
  #   path = [ pkgs.flatpak ];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };

  security.doas.enable = true;
  security.sudo.enable = false;

  security.doas.extraRules = [
    {
      users = [ "yari" ];
      setEnv = [
        "LANG"
        "LC_ALL"
        "PATH"
        "HOME"
      ];
      keepEnv = true;
      persist = true;
    }
  ];

  security.pam.services.swaylock = { };
  security.pam.services.login.enableGnomeKeyring = true;
  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
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

  # programs.steam = {
  #   enable = true;
  #   protontricks.enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  #   extraCompatPackages = with pkgs; [ proton-ge-rtsp-bin ];
  #   extraPackages = with pkgs; [
  #     SDL2
  #     gtk3
  #     mono
  #     gperftools
  #   ];
  # };

  systemd.services.nixos-upgrade.path = [ pkgs.git ];

  users.users.yari = {
    isNormalUser = true;
    description = "yari";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "games"
      "sys"
      "disk"
      "storage"
      "render"
      "podman"
    ];
    subGidRanges = [
      {
        count = 65536;
        startGid = 100000;
      }
    ];
    subUidRanges = [
      {
        count = 65536;
        startUid = 100000;
      }
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.nh = {
    enable = true;
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
    bitwarden-desktop
    # bitwarden-cli
    # bitwarden-menu

    vial
    # qmk
    # dos2unix
    # pkgsCross.avr.buildPackages.gcc

    wine
    pwvucontrol
    telegram-desktop
    trayscale

    # for qute autofil
    # keyutils

    gamemode

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

    gnome-software

    piper
  ];

  services.mpd.enable = true;
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
  # services.usbmuxd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
  # hardware.keyboard.qmk.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  services.ratbagd.enable = true;

  services.irqbalance.enable = true;

  services.udev = {
    packages = with pkgs; [

      # qmk
      # qmk-udev-rules
      via
      vial
    ];
    extraRules = ''
            KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="6964", ATTRS{idProduct}=="0075", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl" 
      SUBSYSTEM=="usb", ATTR{idVendor}=="096e", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="096e", MODE="0664", GROUP="users"
    '';
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05"; # Did you read the comment?
  # system.autoUpgrade.enable = true;

}
