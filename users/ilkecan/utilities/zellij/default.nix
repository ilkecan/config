{
  config,
  inputs,
  lib,
  ...
}:

let
  inherit (lib)
    mkAfter
  ;

  zellijLayoutsRelPath = "zellij/layouts";
  user = config.home.username;
in
{
  imports = [
    ./keybindings.nix
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
        if [[ -z "$ZELLIJ" && -f zellij-layout.kdl ]]; then
          zellij --layout zellij-layout.kdl
        fi
      }

      autoload -U add-zsh-hook
      add-zsh-hook chpwd auto_zellij
    '';
  };

  xdg.configFile.${zellijLayoutsRelPath}.source = "${inputs.self}/users/${user}/dotfiles/.config/${zellijLayoutsRelPath}";
}
