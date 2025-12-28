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
    playerctl
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
      events = {
        before-sleep = (display "off") + "; " + lock;
        after-resume = display "on";
        lock = (display "off") + "; " + lock;
        unlock = display "on";
      };
    };
}
