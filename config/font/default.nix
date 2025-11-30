{ inputs, pkgs, ... }:

{

  home.packages = with pkgs; [ sarasa-gothic ];

  home.file.".local/share/fonts" = {
    source = ./fonts;
    recursive = true;
  };
}
