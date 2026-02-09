{
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.zsh-syntax-highlighting ];

  programs.zsh.syntaxHighlighting = {
    enable = true;
    highlighters = [
      "brackets"
    ];
  };
}
