{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    asm-lsp
    asmfmt
    ast-grep
    nixfmt
    nil
    black
    rustfmt
    rust-analyzer
    basedpyright
    clang-tools
    vim-language-server
    prettier
  ];

  home.file.".config/nvim/lua" = {
    source = ./config/lua;
    recursive = true;
  };
  home.file.".config/nvim/init.lua".source = ./config/init.lua;
}
