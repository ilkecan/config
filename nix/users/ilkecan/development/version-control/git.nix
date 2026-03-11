{
  config,
  ...
}:

{
  programs.git = {
    enable = true;
    settings = {
      checkout = {
        defaultRemote = "origin";
      };

      core = {
        autocrlf = "input";
        editor = config.home.sessionVariables.EDITOR;
      };

      diff = {
        # https://dandavison.github.io/delta/color-moved-support.html
        colorMoved = "default";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        followTags = true;
      };

      user = {
        email = "ilkecan@protonmail.com";
        name = "İlkecan Bozdoğan";
      };
    };
  };
}
