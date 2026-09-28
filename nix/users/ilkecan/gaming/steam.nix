{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    samira # https://github.com/jsnli/Samira
  ];
}
