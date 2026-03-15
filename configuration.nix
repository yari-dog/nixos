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
  imports = [ ./modules ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.steam-hardware.enable = true;
  hardware.firmware = [ pkgs.linux-firmware ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Police = {
        AutoEnable = true;
      };
    };
  };

  console = {
    enable = true;
    earlySetup = true;
    useXkbConfig = true;
  };

  networking.hostName = host.hostName; # Define your hostname.

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "nowatchdog"
    "nmi_watchdog=0"
  ];
  boot.loader.timeout = 0;
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
        "https://nyx.chaotic.cx"
        "https://nix-community.cachix.org"
      ];
    };
  };

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

  systemd.services.nixos-upgrade.path = [ pkgs.git ];

  users.users.yari = {
    isNormalUser = true;
    description = "yari";
    extraGroups = [
      "networkmanager"
      "seat"
      "wheel"
      "video"
      "audio"
      "games"
      "sys"
      "disk"
      "storage"
      "render"
      "podman"
      "gamemode"
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

  virtualisation.spiceUSBRedirection.enable = true;
  # hardware.keyboard.qmk.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
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
