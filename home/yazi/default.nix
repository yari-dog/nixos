{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  programs.yazi = {
    enable = true;
    plugins.smart-enter = pkgs.yaziPlugins.smart-enter;
  };
  home.file.".config/yazi" = {
    source = ./config;
    recursive = true;
  };
}
