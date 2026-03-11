# https://github.com/romkatv/powerlevel10k
{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkBefore
    mkMerge
    ;

  inherit (config.xdg)
    cacheHome
    ;

  pkg = pkgs.zsh-powerlevel10k;
in
{
  home.packages = [ pkg ];

  programs.zsh.initContent = mkMerge [
    (mkBefore ''
      # Powerlevel10k instant prompt
      # https://github.com/romkatv/powerlevel10k#how-do-i-configure-instant-prompt

      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      if [[ -r "${cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "${cacheHome}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '')

    ''
      source "${pkg}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"

      # To customize prompt, run `p10k configure` or edit "$ZDOTDIR"/.p10k.zsh.
      [[ ! -f "$ZDOTDIR"/.p10k.zsh ]] || source "$ZDOTDIR"/.p10k.zsh
    ''
  ];
}
