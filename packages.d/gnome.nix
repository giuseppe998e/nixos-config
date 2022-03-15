{ pkgs, ... }:

let
    font-awesome = pkgs.nerdfonts.override {
        fonts = [ "Hack" ];
    };
in
{
    services = {
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

        gnome = {
            chrome-gnome-shell.enable = true;
            core-utilities.enable = false;
            core-developer-tools.enable = false;
            games.enable = false;
        };
    };

    # Exclude some packages
    environment.gnome.excludePackages = with pkgs; [
        gnome-online-accounts
    ];

    # Include some packages
    programs = {
        evince.enable = true;
        file-roller.enable = true;
    };

    environment.systemPackages = with pkgs.gnome; [
        # Gnome's
        eog
        gedit
        gnome-boxes
        gnome-system-monitor
        gnome-tweaks
        nautilus

        # Others
        pkgs.alacritty
        pkgs.firefox # Cause "firefox-devedition-bin(-unwrapped)" not works with "chrome-gnome-shell"
        pkgs.mpv-unwrapped
    ];

    # Install recommended fonts
    fonts.fonts = with pkgs; [
        font-awesome
        noto-fonts-emoji
    ];

    # Environment variables
    environment.sessionVariables = {
        TERMINAL = "alacritty";
        EDITOR = "gedit";
    };

    # Firefox configurations
    nixpkgs.config.firefox = {
        enableGnomeExtensions = true;
        pipewireSupport = true;
    };
}
