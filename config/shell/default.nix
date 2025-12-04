{
  inputs,
  pkgs,
  host,
  ...
}:

{
  programs.starship.enable = true;

  programs.pay-respects.enable = true;

  programs.zsh = {
    enable = true;

    shellAliases = {
      ns = "nh os switch ~/nix -H ${host}";
      gg = "cd ../";
      htop = "btop";
      cat = "bat";
      fuck = "f";
      nix-shell = "nix-shell --command zsh";
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
