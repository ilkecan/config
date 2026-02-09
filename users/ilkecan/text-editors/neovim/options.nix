{
  ...
}:

let
  inherit (builtins)
    concatStringsSep
  ;

  comSepList = concatStringsSep ",";
in
{
  programs.nvf.settings.vim = {
    options = {
      clipboard = comSepList [ "unnamedplus" ];
      cursorline = true;
      expandtab = true; # https://neovim.io/doc/user/options.html#'expandtab'
      foldenable = false; # disable folds by default
      ignorecase = true;  # https://neovim.io/doc/user/options.html#'ignorecase'
      laststatus = 3;
      lazyredraw = true;
      mouse = "a";
      scrolloff = 2;
      shiftwidth = 0;   # https://neovim.io/doc/user/options.html#'shiftwidth'
      sidescrolloff = 2;
      signcolumn = "number";
      smartcase = true;
      tabstop = 2;  # https://neovim.io/doc/user/options.html#'tabstop'
      title = true;
      viewoptions = comSepList [ "folds" "cursor" ];
      wildmode = comSepList [ "longest:full" "full" ];
      wrap = false;
    };
  };
}
