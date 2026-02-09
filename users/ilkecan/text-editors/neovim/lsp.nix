{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkForce
  ;
in
{
  home.packages = with pkgs; [
    rubyPackages.solargraph
  ];

  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      inlayHints.enable = true;   # https://neovim.io/doc/user/lsp.html#lsp-inlay_hint
      lspSignature.enable = !true;   # https://github.com/ray-x/lsp_signature.nvim
      lspconfig.enable = true;  # https://github.com/neovim/nvim-lspconfig
      lspkind.enable = true;  # https://github.com/onsails/lspkind.nvim
      lspsaga.enable = false;   # https://github.com/nvimdev/lspsaga.nvim
      null-ls.enable = true;  #   https://github.com/nvimtools/none-ls.nvim
      nvim-docs-view.enable = false;  # https://github.com/amrbashir/nvim-docs-view

      servers = {
      #   "*" = {
      #     root_markers = [".git"];
      #     capabilities = {
      #       textDocument = {
      #         semanticTokens = {
      #           multilineTokenSupport = true;
      #         };
      #       };
      #     };
      #   };
        solargraph.cmd = mkForce [ "solargraph" "stdio" ];
      };
    };
  };
}
