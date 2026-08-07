{ ... }:

{
  imports = [
    ./fonts.nix
    ./hardware.nix
    ./greetd.nix
    ./nix-ld.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./virtualisation.nix
    ./xdg.nix
    # ./cosmic
  ];
}
