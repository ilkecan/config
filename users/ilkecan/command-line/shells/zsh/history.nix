{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    mkOrder
  ;

  inherit (config.xdg)
    stateHome
  ;

  cfg = config.programs.zsh;
in
{
  programs.zsh = {
    initContent = mkOrder 571 ''
      # history search
      autoload -Uz \
        up-line-or-beginning-search \
        down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
    '';

    history = {
      path = "${stateHome}/zsh/history";
      size = 1000000000;
      save = cfg.history.size;

      # https://github.com/zsh-users/zsh-history-substring-search/issues/116
      # historySubstringSearch = {
      #   enable = true;
      # };

      expireDuplicatesFirst = true;
      extended = true;
      findNoDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = false;
    };

    setOptions = [
      ## History
      # "EXTENDED_HISTORY"
      # "HIST_EXPIRE_DUPS_FIRST"
      # "HIST_FCNTL_LOCK"
      # "HIST_FIND_NO_DUPS"
      # "HIST_IGNORE_DUPS"
      # "HIST_IGNORE_SPACE"
      "HIST_REDUCE_BLANKS"
      "INC_APPEND_HISTORY_TIME"
    ];
  };
}
