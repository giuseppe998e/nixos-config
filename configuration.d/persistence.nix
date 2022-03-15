{
    fileSystems = {
        # Bind "/etc/nixos" directory
        # mkdir -p etc/nixos
        "/etc/nixos" = {
            device = "/nix/persist/etc/nixos";
            fsType = "none";
            options = [ "bind" ];
            depends = [ "/nix/persist" ];
        };

        # Bind "/var/log" directory
        # mkdir -p var/log
        "/var/log" = {
            device = "/nix/persist/var/log";
            fsType = "none";
            options = [ "bind" ];
            depends = [ "/nix/persist" ];
        };

        # Bind "/var/lib" directory
        # mkdir -p var/lib
        "/var/lib" = {
            device = "/nix/persist/var/lib";
            fsType = "none";
            options = [ "bind" ];
            depends = [ "/nix/persist" ];
        };

        # Bind "/var/cache" directory
        # mkdir -p var/cache
        #"/var/cache" = {
        #    device = "/nix/persist/var/cache";
        #    fsType = "none";
        #    options = [ "bind" ];
        #    depends = [ "/nix/persist" ];
        #};
    };

    environment.etc = {
        # Used by systemd for the journal
        "machine-id".source =
            "/nix/persist/etc/machine-id";

        # Correct the time to synchronize the system clock
        "adjtime".source =
            "/nix/persist/etc/adjtime";

        # Maintains network connection information
        "NetworkManager/system-connections".source =
            "/nix/persist/etc/NetworkManager/system-connections";
    };
}
