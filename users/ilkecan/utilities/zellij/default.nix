{
  lib,
  ...
}:

let
  inherit (lib)
    mkOrder
  ;
in
{
  imports = [
    ./keybindings.nix
    ./layouts
    ./plugins
  ];

  programs = {
    zellij = {
      enable = true; # https://github.com/zellij-org/zellij

      settings = {
        web_client = {
          font = ["monospace"];
        };

        show_startup_tips = false;
      };

      themes = {
      };
    };

    # before Powerlevel10k instant prompt
    zsh.initContent = mkOrder 100 ''
      auto_zellij() {
        if [[ -z "$ZELLIJ" ]]; then
          file=".zellij-layout-name.txt"
          if [[ -f $file ]]; then
            zellij --layout $(cat $file)
            return
          fi

          file=".zellij-layout.kdl"
          if [[ -f $file ]]; then
            zellij --layout $file
            return
          fi
        fi
      }

      autoload -U add-zsh-hook
      add-zsh-hook chpwd auto_zellij
      auto_zellij
    '';
  };
}
