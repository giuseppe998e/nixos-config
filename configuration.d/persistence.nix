{
    fileSystems = {
        # Bind "/etc/nixos" directory
        # mkdir -p etc/nixos
        "/etc/nixos" = {
            device = "/nix/persist/etc/nixos";
            fsType = "none";
            options = [ "bind" ];
        };

        # Bind "/etc/NetworkManager/system-connections" directory
        # mkdir -p etc/NetworkManager/system-connections
        "/etc/NetworkManager/system-connections" = {
            device = "/nix/persist/etc/NetworkManager/system-connections";
            fsType = "none";
            options = [ "bind" ];
        };

        # Bind "/var/log" directory
        # mkdir -p var/log
        "/var/log" = {
            device = "/nix/persist/var/log";
            fsType = "none";
            options = [ "bind" ];
        };

        # Bind "/var/cache" directory
        # mkdir -p var/cache
        #"/var/cache" = {
        #    device = "/nix/persist/var/cache";
        #    fsType = "none";
        #    options = [ "bind" ];
        #};

        # Bind "/var/lib/bluetooth" directory
        # mkdir -p var/lib/bluetooth
        "/var/lib/bluetooth" = {
            device = "/nix/persist/var/lib/bluetooth";
            fsType = "none";
            options = [ "bind" ];
        };
    };

    environment.etc = {
        # "machine-id" is used by systemd for the journal
        "machine-id".source = "/nix/persist/etc/machine-id";
    };
}
