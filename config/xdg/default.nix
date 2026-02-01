{ pkgs, lib, ... }:

{
  home.sessionVariables.TERM = "foot";
  home.sessionVariables.TERMCMD = "foot";
  home.sessionVariables.TERMINAL = "foot";
  home.sessionVariables.EDITOR = "nvim";
  home.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
}
