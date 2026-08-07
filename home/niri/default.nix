{
  host,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    inputs.wayland-pipewire-idle-inhibit.homeModules.default
  ];
  home.packages = with pkgs; [
    xwayland-satellite
    playerctl
  ];

  services.awww.enable = true;

  # programs.swaylock.enable = true;
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };

      background = lib.mkForce [
        {
          path = "/home/yari/Pictures/mr wolp edited 2.png";
          blur_passes = 0;
          blur_size = 0;
        }
      ];

      input-field = lib.mkForce [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(28, 28, 28)";
          outer_color = "rgb(142, 192, 124)";
          outline_thickness = 2;
          placeholder_text = "<span foreground=\"##a89984\">Password...</span>";
          shadow_passes = 0;
          rounding = 2;
        }
      ];
    };
  };

  services.hypridle = {
    settings =
      let
        lock = "hyprlock -g 15";
        display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
      in
      {
        general = {
          after_sleep_cmd = display "on";
          ignore_dbus_inhibit = false;
          lock_cmd = lock;
        };
        listener = [
          {
            on-timeout = lock;
            timeout = 900;
          }
          {
            on-resume = display "on";
            on-timeout = display "off";
            timeout = 1200;
          }
        ];
      };
  };

  home.file.".config/niri/host".source = ./config/${host};
  home.file.".config/niri/config.kdl".source = ./config/config.kdl;
  home.file.".config/niri/base" = {
    source = ./config/base;
    recursive = true;
  };
  home.file.".config/niri/vim-niri-nav".source = ./config/vim-niri-nav;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  services.wayland-pipewire-idle-inhibit = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = {
      verbosity = "ERROR";
      media_minimum_duration = 10;
      idle_inhibitor = "wayland";
      # examples
      sink_whitelist = [
        { name = "Starship/Matisse HD Audio Controller Analog Stereo"; }
      ];
      node_blacklist = [
        { name = "spotify"; }
        { app_name = "Music Player Daemon"; }
      ];
    };
  };
}
