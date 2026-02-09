# https://github.com/romkatv/powerlevel10k
{
  config,
  inputs,
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

  configRelPath = "zsh/.p10k.zsh";
  user = config.home.username;
in
{
  home.packages = [ pkgs.zsh-powerlevel10k ];

  xdg.configFile.${configRelPath}.source = "${inputs.self}/users/${user}/dotfiles/.config/${configRelPath}";

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
      source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"

      # To customize prompt, run `p10k configure` or edit "$ZDOTDIR"/.p10k.zsh.
      [[ ! -f "$ZDOTDIR"/.p10k.zsh ]] || source "$ZDOTDIR"/.p10k.zsh
    ''
  ];
}
