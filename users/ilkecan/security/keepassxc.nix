{
  ...
}:

{
  programs.keepassxc = {
    enable = true;
    autostart = true;
    settings = {
      Browser = {
        UpdateBinaryPath = false;
      };

      GUI = {
        HideUsernames = true;
      };

      PasswordGenerator = {
        Length = 64;
        SpecialChars = false;
      };

      Security = {
        IconDownloadFallback = true;
        LockDatabaseIdle = false;
      };
    };
  };
}
