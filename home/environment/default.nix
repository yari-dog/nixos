{ pkgs, lib, ... }:

{
  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
}
