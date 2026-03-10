{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    clang-tools # https://github.com/llvm/llvm-project/tree/main/clang-tools-extra/clangd
    lua-language-server # https://github.com/luals/lua-language-server
    pyright # https://github.com/Microsoft/pyright
    rust-analyzer # https://github.com/rust-lang/rust-analyzer
    typescript-language-server # https://github.com/typescript-language-server/typescript-language-server
  ];
}
