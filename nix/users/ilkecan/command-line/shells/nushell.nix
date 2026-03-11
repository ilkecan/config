{
  pkgs,
  ...
}:

{
  programs.nushell = {
    enable = true;

    plugins = with pkgs.nushellPlugins; [
      # bson # https://github.com/Kissaki/nu_plugin_bson
      desktop_notifications # https://github.com/FMotalleb/nu_plugin_desktop_notifications
      formats # https://www.nushell.sh/commands/categories/formats.html
      gstat # https://www.nushell.sh/commands/docs/gstat.html
      highlight # https://github.com/cptpiepmatz/nu-plugin-highlight
      polars # https://www.nushell.sh/commands/docs/polars.html
      skim # https://github.com/idanarye/nu_plugin_skim
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
