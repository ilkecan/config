{
  ...
}:

{
  imports = [
    ./neovide.nix
    ./neovim
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "neovide";
  };
}
