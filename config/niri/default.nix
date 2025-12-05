{
  inputs,
  pkgs,
  host,
  ...
}:

{
  home.packages = with pkgs; [
    xwayland-satellite
    swaylock
    alacritty
  ];

  home.file.".config/niri/host".source = ./config/${host};
  home.file.".config/niri/config.kdl".source = ./config/config.kdl;
  home.file.".config/niri/base" = {
    source = ./config/base;
    recursive = true;
  };
  home.file.".config/niri/vim-niri-nav".source = ./config/vim-niri-nav;

  services.swayidle =
    let
      # Lock command
      lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
      # TODO: modify "display" function based on your window manager
      # Sway
      # display = status: "${pkgs.sway}/bin/swaymsg 'output * power ${status}'";
      # Hyprland
      # display = status: "hyprctl dispatch dpms ${status}";
      # Niri
      display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in
    {
      enable = true;
      timeouts = [
        {
          timeout = 295; # in seconds
          command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
        }
        {
          timeout = 300;
          command = lock;
        }
        {
          timeout = 305;
          command = display "off";
          resumeCommand = display "on";
        }
        {
          timeout = 315;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          # adding duplicated entries for the same event may not work
          command = (display "off") + "; " + lock;
        }
        {
          event = "after-resume";
          command = display "on";
        }
        {
          event = "lock";
          command = (display "off") + "; " + lock;
        }
        {
          event = "unlock";
          command = display "on";
        }
      ];
    };
}
