{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  programs.yazi = {
    enable = true;
    plugins = with pkgs.yaziPlugins; {
      smart-enter.package = smart-enter;
      split-tabs.package = split-tabs;
      clipboard-ya.package = clipboard;
      keep-preferences.package = keep-preferences;
      full-border.package = full-border;
      yatline.package = yatline;
      drag.package = drag;
      mount.package = mount;
      mediainfo.package = mediainfo;
    };
    package = (pkgs.yazi.override { _7zz = pkgs._7zz-rar; });
  };
  home.file.".config/yazi" = {
    source = ./config;
    recursive = true;
  };
}
