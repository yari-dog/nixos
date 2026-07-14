{
  pkgs,
  host,
  inputs,
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

  programs.swaylock.enable = true;

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
      verbosity = "INFO";
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
