{ pkgs, ... }:

let
    font-awesome = pkgs.nerdfonts.override {
        fonts = [ "Hack" ];
    };
in
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
    environment.gnome.excludePackages = with pkgs; [
        epiphany
        gnome-connections
        gnome-online-accounts
        gnome-passwordsafe
        gnome-photos
        gnome-tour
        gnome.atomix
        gnome.cheese
        gnome.geary
        gnome.gnome-calculator
        gnome.gnome-calendar
        gnome.gnome-characters
        gnome.gnome-clocks
        gnome.gnome-contacts
        gnome.gnome-font-viewer
        gnome.gnome-logs
        gnome.gnome-maps
        gnome.gnome-music
        gnome.gnome-screenshot
        gnome.gnome-weather
        gnome.hitori
        gnome.iagno
        gnome.seahorse
        gnome.tali
        gnome.totem
        gnome.yelp
        simple-scan
    ];

    # Install recommended packages
    environment.systemPackages = with pkgs; [
        alacritty
        firefox-devedition-bin
        gnome.gnome-tweaks
        mpv
    ];

    # Install recommended fonts
    fonts.fonts = with pkgs; [
        font-awesome
        noto-fonts-emoji
    ];

    # Firefox configurations
    nixpkgs.config.firefox-devedition-bin = {
        enableGnomeExtensions = true;
        pipewireSupport = true;
    };
}
