{
  config,
  ...
}:

{
  imports = [
    ./nushell.nix
    ./zsh
  ];

  home.defaultShell = config.programs.zsh.package;
}
