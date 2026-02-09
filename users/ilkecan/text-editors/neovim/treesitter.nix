{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib.generators)
    mkLuaInline
  ;
in

{
  programs.nvf.settings.vim = {
    treesitter = {
      enable = true;  # https://github.com/nvim-treesitter/nvim-treesitter
      context.enable = true;  # https://github.com/nvim-treesitter/nvim-treesitter-context
      fold = true;
      grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      highlight = {
        disable = mkLuaInline ''
          -- Disable slow treesitter highlight for large files
          function(lang, buf)
            local max_filesize = 1000 * 1024 -- 1MB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
          end
        '';
      };
      textobjects.enable = true;  # https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    };
  };
}
