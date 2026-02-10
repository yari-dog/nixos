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
}
