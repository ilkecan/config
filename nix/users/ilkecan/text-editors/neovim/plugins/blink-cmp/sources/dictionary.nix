# https://github.com/Kaiser-Yang/blink-cmp-dictionary
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
  programs.nvf.settings.vim.extraPackages = with pkgs; [
    wordnet
  ];

  # https://github.com/Kaiser-Yang/blink-cmp-dictionary#how-to-enable-this-plugin-for-comment-blocks-or-specific-file-types-only
  programs.nvf.settings.vim.luaConfigRC.blink-cmp-dictionary = ''
    function inside_comment_block()
        if vim.api.nvim_get_mode().mode ~= 'i' then
            return false
        end
        local node_under_cursor = vim.treesitter.get_node()
        local parser = vim.treesitter.get_parser(nil, nil, { error = false })
        local query = vim.treesitter.query.get(vim.bo.filetype, 'highlights')
        if not parser or not node_under_cursor or not query then
            return false
        end
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        row = row - 1
        for id, node, _ in query:iter_captures(node_under_cursor, 0, row, row + 1) do
            if query.captures[id]:find('comment') then
                local start_row, start_col, end_row, end_col = node:range()
                if start_row <= row and row <= end_row then
                    if start_row == row and end_row == row then
                        if start_col <= col and col <= end_col then
                            return true
                        end
                    elseif start_row == row then
                        if start_col <= col then
                            return true
                        end
                    elseif end_row == row then
                        if col <= end_col then
                            return true
                        end
                    else
                        return true
                    end
                end
            end
        end
        return false
    end
  '';

  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    setupOpts.sources.providers.dictionary = {
      enabled = mkLuaInline ''
        function()
          return vim.tbl_contains({ 'markdown', 'text' }, vim.bo.filetype) or inside_comment_block()
        end
      '';
      min_keyword_length = 3;
      opts = {
        dictionary_files = [ "${pkgs.nur.repos.moraxyc.english-words}/share/english-words/words_alpha.txt" ];
      };
    };

    sourcePlugins.dictionary = {
      enable = true;
      package = pkgs.vimPlugins.blink-cmp-dictionary;
      module = "blink-cmp-dictionary";
    };
  };
}
