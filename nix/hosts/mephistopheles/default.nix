{
  ...
}:

{
  imports = [
    ./android.nix
    ./bluetooth.nix
    ./boot
    ./disk-config.nix
    ./display-manager.nix
    ./file-systems.nix
    ./fonts.nix
    ./gaming.nix
    ./gnome.nix
    ./hardware
    ./impermanence.nix
    ./input.nix
    ./locale.nix
    ./multimedia.nix
    ./networking
    ./nix
    ./security.nix
    ./sops.nix
    ./users.nix
  ];

  services = {
    gvfs.enable = true;   # required for "Trash"
    udisks2.enable = true;  # required for udiskie
  };

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "colemak";
  };

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
    nano.enable = false;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
    nixos.includeAllModules = true;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
