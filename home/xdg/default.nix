{ lib, ... }:
{
  xdg = {
    enable = true;
    terminal-exec = {
      enable = true;
      settings.default = [ "foot.desktop" ];
    };
  };
}
