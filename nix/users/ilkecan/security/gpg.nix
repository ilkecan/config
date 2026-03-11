{
  config,
  ...
}:

let
  inherit (config.xdg)
    dataHome
  ;
in
{
  programs.gpg = {
    enable = true;
    homedir = "${dataHome}/gnupg";
    mutableKeys = false;
    mutableTrust = false;

    publicKeys = [
    ];

    settings = {
    };
  };
}
