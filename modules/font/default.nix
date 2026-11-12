{ pkgs, ... }:

{
  imports = [ ./fonts.nix ];

  fonts.fontconfig = {
    enable = true;
    hinting.style = "full";
  };
}
