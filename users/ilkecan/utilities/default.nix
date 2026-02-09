{
  ...
}:

{
  imports = [
    ./coreutils.nix
    ./disk.nix
    ./zellij
  ];

  programs = {
    atuin = {
      enable = true;
      flags = [
      ];

      daemon = {
        enable = true;
      };

      forceOverwriteSettings  = true;
      settings = {
        enter_accept = true;
      };
    };
  };
}
