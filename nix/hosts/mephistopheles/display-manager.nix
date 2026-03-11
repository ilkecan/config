{
  userConfig,
  ...
}:

{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = userConfig.home.username;
        command = "niri-session";
      };
    };
  };

  programs.regreet = {
    # https://github.com/rharish101/ReGreet
    enable = true;
    settings = {
    };
  };
}
