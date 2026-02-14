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
          file=".zellij-layout-name.txt"
          if [[ -f $file ]]; then
            zellij --layout $(cat $file)
          fi

          file=".zellij-layout.kdl"
          if [[ -f $file ]]; then
            zellij --layout $file
          fi
        fi
      }

      autoload -U add-zsh-hook
      add-zsh-hook chpwd auto_zellij
    '';
  };
}
