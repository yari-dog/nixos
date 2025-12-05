{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  # home.packages = with pkgs; [
  #   (yazi.packages.${pkgs.system}.default.override {
  #     _7zz = pkgs._7zz-rar;
  #   })
  # ];
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
  home.file.".config/yazi" = {
    source = ./config;
    recursive = true;
  };
  # xdg.desktopEntries.yazi = {
  #   name = "yazi";
  #   exec = "yazi";
  # };
  # home.file.".local/share/applications/yazi.desktop" = ./yazi.desktop;
}
