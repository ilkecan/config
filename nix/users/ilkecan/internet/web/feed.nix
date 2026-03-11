{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    newsflash   # https://gitlab.com/news-flash/news_flash_gtk
  ];
}
