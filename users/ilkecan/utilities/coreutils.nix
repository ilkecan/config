{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    uutils-coreutils-noprefix
    uutils-diffutils
    uutils-findutils
  ];

  programs = {
    fzf = {
      # https://github.com/junegunn/fzf
      enable = true;
    };

    zoxide = {
      # https://github.com/ajeetdsouza/zoxide
      enable = true;
      options = [];
    };
  };
}
