{ inputs, pkgs, ... }:

{
  imports = [ ./nixvim.nix ];
  home.packages = with pkgs; [
    asm-lsp
    asmfmt
    ast-grep
    basedpyright
    # black
    # clang-tools
    vim-language-server
  ];

  # home.file.".config/nvim/lua" = {
  #   source = ./config/lua;
  #   recursive = true;
  # };
  # home.file.".config/nvim/init.lua".source = ./config/init.lua;
}
