{
  ...
}:

{
  imports = [ ./foot.nix ];

  programs.fish.enable = true;

  programs.starship.enable = true;

  programs.pay-respects.enable = true;

  home.file.".config/starship.toml".source = ./starship.toml;
}
