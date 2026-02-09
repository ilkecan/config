{
  ...
}:

{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              end = "-32G";
              content = {
                type = "btrfs";
                extraArgs = [ "-L" "nixos" "-f" ]; # Override existing partition
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "/home" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/home";
                  };
                  "/nix" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/nix";
                  };
                  "/persist" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/persist";
                  };
                  "/log" = {
                    mountOptions = [ "compress=zstd" "noatime" ];
                    mountpoint = "/var/log";
                  };
                };
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
              };
            };
          };
        };
        postCreateHook = ''
          MNTPOINT=$(mktemp -d)
          mount "/dev/disk/by-label/nixos" --options subvolid=5 "$MNTPOINT"
          trap 'umount $MNTPOINT; rm -rf $MNTPOINT' EXIT
          btrfs subvolume snapshot -r $MNTPOINT/root $MNTPOINT/root-blank
        '';
      };
    };
  };

  fileSystems."/persist".neededForBoot = true;
  fileSystems."/var/log".neededForBoot = true;
}
