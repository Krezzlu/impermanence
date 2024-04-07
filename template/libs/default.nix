{
  diskSetup = {
    device ? throw "Missing required argument device. (e.g. /dev/sda)",
    swapCapacity ? throw "Missing required argument swapCapacity. (e.g. 16G)",
    ssd ? false,
    ...
  }: {
    disko.devices = {
      disk.main = {
        inherit device;

        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            "esp" = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };

            "luks" = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings.allowDiscards = true;

                content = {
                  type = "btrfs";
                  extraArgs = ["-f"];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      mountOptions =
                        [
                          "compress=zstd"
                          "noatime"
                        ]
                        ++ (
                          if ssd
                          then ["ssd"]
                          else []
                        );
                    };
                    "/persist" = {
                      mountpoint = "/persist";
                      mountOptions =
                        [
                          "compress=zstd"
                          "noatime"
                        ]
                        ++ (
                          if ssd
                          then ["ssd"]
                          else []
                        );
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions =
                        [
                          "compress=zstd"
                          "noatime"
                        ]
                        ++ (
                          if ssd
                          then ["ssd"]
                          else []
                        );
                    };
                    "/swap" = {
                      mountpoint = "/.swapvol";
                      swap.swapfile.size = swapCapacity;
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
