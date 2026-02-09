{
  homeConfig,
  ...
}:

{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = homeConfig.home.username;
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
