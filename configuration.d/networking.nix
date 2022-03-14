{
    networking = {
        # Computer's hostname
        hostName = "nixos";

        # Enable WiFi support (wpa_supplicant)
        #wireless.enable = true;

        # Enable DHCP per-interface
        #useDHCP = false;
        #interfaces.wlp0s20f3.useDHCP = true;

        # Firewall
        firewall = {
            enable = true;
            #allowedTCPPorts = [];
            #allowedUDPPorts = [];
        };
    };
}
