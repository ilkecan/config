{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    wget
  ];

  programs = {
    aria2 = {
      # https://github.com/aria2/aria2
      enable = true;
      # https://aria2.github.io/manual/en/html/aria2c.html
      settings = {
      };
    };

    yt-dlp = {
      # https://github.com/yt-dlp/yt-dlp
      enable = true;
      # https://github.com/yt-dlp/yt-dlp#configuration
      settings = {
        embed-metadata = true;
        force-keyframes-at-cuts = true;
        sponsorblock-mark = "all";
      };
    };
  };
}
