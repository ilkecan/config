{
  pkgs,
  ...
}:

{
  programs.nushell = {
    enable = true;
    plugins = with pkgs.nushellPlugins; [
    ];

    settings = {
    };

    # configFile.text = ''
    # '';
    # envFile.text = ''
    # '';
    # loginFile.text = '';
    # '';
  };
}
