{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  programs.yazi = {
    enable = true;
  };
  home.file.".config/yazi" = {
    source = ./config;
    recursive = true;
  };
}
