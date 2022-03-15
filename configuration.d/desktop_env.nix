{ pkgs, ... }:

{
    services = {
        # Gnome Desktop
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

        # Disable some GNOME services
        gnome = {
            chrome-gnome-shell.enable = true;
            games.enable = false;
            gnome-initial-setup.enable = false;
            gnome-remote-desktop.enable = false;
            rygel.enable = false;
            tracker-miners.enable = false;
            tracker.enable = false;
        };
    };

    programs = {
        gnome-documents.enable = false;
        gnome-terminal.enable = false;
    };

    # Exclude some packages in Gnome
    environment.gnome.excludePackages = [
        pkgs.epiphany
        pkgs.gnome-connections
        pkgs.gnome-online-accounts
        pkgs.gnome-passwordsafe
        pkgs.gnome-photos
        pkgs.gnome-tour
        pkgs.gnome.atomix
        pkgs.gnome.cheese
        pkgs.gnome.geary
        pkgs.gnome.gnome-calculator
        pkgs.gnome.gnome-characters
        pkgs.gnome.gnome-contacts
        pkgs.gnome.gnome-logs
        pkgs.gnome.gnome-maps
        pkgs.gnome.gnome-music
        pkgs.gnome.gnome-screenshot
        pkgs.gnome.gnome-weather
        pkgs.gnome.hitori
        pkgs.gnome.iagno
        pkgs.gnome.tali
        pkgs.gnome.totem
        pkgs.gnome.yelp
        pkgs.simple-scan
    ];

    environment.systemPackages = with pkgs; [
        alacritty
        firefox-devedition-bin
    ];
}
