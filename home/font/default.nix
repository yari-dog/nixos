{ config, ... }:

{
  home.file.".local/share/fonts/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/home/font/fonts";
    recursive = true;
  };
}
