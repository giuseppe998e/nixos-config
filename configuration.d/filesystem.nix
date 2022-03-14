{
    fileSystems = {
        # Root path
        "/" = {
            device = "none";
            fsType = "tmpfs";
            options = [ "defaults" "noatime" "mode=755" ];
        };

        # Boot path
        "/boot" = {
            device = "/dev/disk/by-uuid/*TBD*";
            fsType = "vfat";
            options = [ "defaults" "noatime" ];
        };

        # Nix path
        "/nix" = {
            device = "/dev/disk/by-uuid/*TBD*";
            fsType = "btrfs";
            options = [ "noatime" "compress=zstd" "subvol=@nix" ];
        };

        # Home path
        "/home" = {
            device = "/dev/disk/by-uuid/*TBD*";
            fsType = "btrfs";
            options = [ "noatime" "compress=zstd" "subvol=@home" ];
        };
    };

    swapDevices = [ ];
}
