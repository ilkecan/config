{
  ...
}:

{
  imports = [
    ./ilkecan
  ];

  programs.firefox.profiles.ilkecan = {
    id = 0;
    isDefault = true;
  };
}
