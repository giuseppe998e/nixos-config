{
    networking = {
        # Computer's hostname
        hostName = "nixos";

        # Enable WiFi support (wpa_supplicant)
        #wireless.enable = true;

        # Enable DHCP per-interface
        #useDHCP = false;
        #interfaces.wlp0s20f3.useDHCP = true;

        # Nameservers
        nameservers = [
            "1.1.1.1"
            "1.0.0.1"
        ];

        # Firewall
        firewall = {
            enable = true;
            #allowedTCPPorts = [];
            #allowedUDPPorts = [];
        };
    };
}
