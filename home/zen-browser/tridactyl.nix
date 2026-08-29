{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dotool
  ];
  home.file.".config/tridactyl".source = ./tridactyl-config;
}
