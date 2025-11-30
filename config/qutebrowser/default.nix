{ input, pkgs, ... }:

{
  home.packages = with pkgs; [ qutebrowser ];
  home.file.".config/qutebrowser/config.py".source = ./config/config.py;
  home.file.".config/qutebrowser/custom".source = ./config/custom;
}
