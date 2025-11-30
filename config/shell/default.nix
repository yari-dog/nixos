{ inputs, pkgs, ... }:

{
  programs.starship.enable = true;

  programs.pay-respects.enable = true;

  programs.zsh = {
    enable = true;

    shellAliases = {
      nswitch =
        "doas /run/current-system/sw/bin/nixos-rebuild switch --flake ~/nix#$(uname -n)";
      gg = "cd ../";
      htop = "btop";
      cat = "bat";
      fuck = "f";
      sudo = "doas";
    };

    profileExtra = ''
      eval $(starship init zsh)

      eval $(pay-respects zsh)
    '';
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "kernel"
        "packages"
        "memory"
        "cpu"
        "gpu"
        "display"
        "wm"
        "terminal"
        "uptime"
      ];
      display = {
        color = {
          keys = "bold_white";
          title = "bold_white";
        };
      };
    };
  };

  home.file.".config/starship.toml".source = ./starship.toml;
  home.file.".config/foot".source = ./foot;
}
