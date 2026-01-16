{ config, lib, pkgs, ... }:
{
 # packages that only make sense on a desktop
  environment.systemPackages = with pkgs; [
    rustup
    rustc
    cargo
    lua-language-server
    # rust-analyzer rust analyzer is managed by rustup
    gopls
    vscode-langservers-extracted # html lsp, css lsp + json
    sqls
    nimlsp
    metals # scala
    typescript-language-server
    elixir-ls
  ];
}
