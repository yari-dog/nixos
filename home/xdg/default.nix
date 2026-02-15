{ lib, ... }:
{
  xdg = lib.mkDefault {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = [ "feh.desktop" ];
        "video/mp4" = [ "mpv.desktop" ];
      };
    };
    terminal-exec.settings.default = [ "foot.desktop" ];
  };
}
