{ inputs, pkgs, ... }:

{
  home.file.".config/nvim/lua" = {
    source = ./config/lua;
    recursive = true;
  };
  home.file.".config/nvim/init.lua".source = ./config/init.lua;
}
