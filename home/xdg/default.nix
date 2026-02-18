{ lib, ... }:
{
  xdg = {
    enable = true;
    terminal-exec.settings.default = [ "foot.desktop" ];
  };
}
