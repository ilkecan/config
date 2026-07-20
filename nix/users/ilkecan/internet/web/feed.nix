{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    unstable.newsflash # https://gitlab.com/news-flash/news_flash_gtk
  ];
}
