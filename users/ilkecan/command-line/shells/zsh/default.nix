{
  config,
  lib,
  ...
}:

let
  inherit (lib)
    concatLines
    escapeShellArg
    mapAttrsToList
    mkMerge
    mkOrder
  ;

  inherit (config.xdg)
    cacheHome
    configHome
  ;

  keyBindings = {
    "^H" = "vi-backward-kill-word";
    "^W" = "backward-kill-word";
    "^[[1;5C" = "forward-word";
    "^[[1;5D" = "backward-word";
    "^[[A" = "up-line-or-beginning-search";
    "^[[B" = "down-line-or-beginning-search";
  };

  aliases = {
    killall = "killall -9";
    ls = "ls --classify=auto --human-readable --color=auto";
    vimdiff = "nvim -d";
  };
in
{
  imports = [
    ./autosuggestion.nix
    ./history.nix
    ./options.nix
    ./powerlevel10k.nix
    ./syntax-highlighting.nix
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${configHome}/zsh";

    initContent = mkMerge [
      (mkOrder 531 ''
        ## ZLE key bindings
        ${concatLines (mapAttrsToList (n: v: "bindkey '${n}' ${v}") keyBindings)}
      '')

      (mkOrder 951 ''
        ## aliases
        ${concatLines (mapAttrsToList (n: v: "alias ${n}=${escapeShellArg v}") aliases)}
      '')
    ];

    completionInit = ''
      # Enable autocompletion.
      autoload -Uz compinit && compinit -d "${cacheHome}"/zsh/zcompdump-"$ZSH_VERSION"

      # Enable compatibility with bash's completion system.
      autoload -Uz bashcompinit && bashcompinit

      # https://www.zsh.org/mla/users/2011/msg00531.html
      zstyle ':completion:*' rehash true
    '';

    autocd = true;
    defaultKeymap = "viins";

    plugins = [
    ];
  };
}
