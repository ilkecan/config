# https://github.com/NotAShelf/nvf/
{
  ...
}:

{
  imports = [
    ./autocmds.nix
    ./globals.nix
    ./keymaps.nix
    ./languages.nix
    ./lsp.nix
    ./lua.nix
    ./options.nix
    ./plugins
    ./treesitter
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        enableLuaLoader = true;   # https://github.com/lewis6991/impatient.nvim

        withNodeJs = true;
        withPython3 = true;

        spellcheck = {
          enable = true;
          programmingWordlist.enable = true;
        };
      };
    };
  };
}
