{
  ...
}:

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

    zsh.initContent = ''
      auto_zellij() {
        if [[ -z "$ZELLIJ" ]]; then
          if [[ -f zellij-layout-name.txt ]]; then
            zellij --layout $(cat zellij-layout-name.txt)
          elif [[ -f zellij-layout.kdl ]]; then
            zellij --layout zellij-layout.kdl
          fi
        fi
      }

      autoload -U add-zsh-hook
      add-zsh-hook chpwd auto_zellij
    '';
  };
}
