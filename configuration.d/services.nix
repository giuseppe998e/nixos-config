{
    services = {
        # PipeWire
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            #jack.enable = true;

            # Use the example session manager (no others are packaged yet so this is enabled by default)
            #media-session.enable = true;
        };

        # xServer
        xserver = {
            enable = true;

            # GDM Display Manager
            displayManager.gdm = {
                enable = true;
                wayland = true;
            };

            # Gnome Desktop Environment
            desktopManager.gnome.enable = true;
        };

        # Gnome services
        gnome = {
            games.enable = false;
            rygel.enable = false;
            tracker.enable = false;
            tracker-miners.enable = false;
            gnome-initial-setup.enable = false;
            gnome-documents.enable = false;
            gnome-online-miners.enable = false;
            gnome-remote-desktop.enable = false;
            chrome-gnome-shell.enable = true;
        };
    };
}
