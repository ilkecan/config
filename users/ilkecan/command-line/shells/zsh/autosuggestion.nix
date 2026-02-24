{
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkOrder
  ;
in
{
  home.packages = with pkgs; [ zsh-autosuggestions ];

  programs.zsh.initContent = mkOrder 701 ''
    export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
  '';

  programs.zsh.autosuggestion = {
    enable = true;
    highlight = "fg=10";
    strategy = [
      "history"
      "completion"
    ];
  };
}
