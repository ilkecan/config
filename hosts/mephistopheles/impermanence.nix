{
  ...
}:

{
  boot.initrd.systemd.services.rollback = {
    description = "Rollback BTRFS root subvolume to a pristine state";
    wantedBy = [
      "initrd.target"
    ];

    after = [
      "initrd-root-device.target"   # https://discourse.nixos.org/t/impermanence-vs-systemd-initrd-w-tpm-unlocking/25167/7
    ];

    before = [
      "sysroot.mount"
    ];

    unitConfig.DefaultDependencies = "no";
    serviceConfig.Type = "oneshot";
    script = ''
      mkdir /btrfs_tmp
      mount /dev/disk/by-label/nixos /btrfs_tmp

      if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
      fi

      for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
        btrfs subvolume delete --recursive "$i"
      done

      btrfs subvolume snapshot /btrfs_tmp/root-blank /btrfs_tmp/root
      umount /btrfs_tmp
    '';
  };

  environment.persistence."/persist" = {
    hideMounts = true;
    allowTrash = true;
    directories = [
      "/etc/NetworkManager/system-connections" # networking.networkmanager.enable
      "/var/lib/bluetooth"  # hardware.bluetooth.enable
      "/var/lib/fprint"  # services.fprintd.enable
      "/var/lib/fwupd"  # fwupdmgr update
      "/var/lib/iwd"  # networking.wireless.iwd.enable
      "/var/lib/nixos" # https://nixos.org/manual/nixos/unstable/#sec-state-users
      "/var/lib/systemd"  # https://nixos.org/manual/nixos/unstable/#sec-var-systemd
    ];
    files = [
      "/etc/adjtime"  # https://man.archlinux.org/man/adjtime_config.5.en
      "/etc/machine-id"   # https://nixos.org/manual/nixos/unstable/#sec-machine-id

      # to avoid "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };

  # TODO: also manage ~/ directory
  # NOTE: also snapshot `home-blank` with disko's `postCreateHook`
  # https://github.com/nix-community/impermanence#usersbird
}
