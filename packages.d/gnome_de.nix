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
            core-utilities.enable = false;
            core-developer-tools.enable = false;
            games.enable = false;
    };

    # Install recommended packages
    environment.systemPackages = with pkgs; [
        alacritty
        firefox #Cause "firefox-devedition-bin(-unwrapped)" not works with "chrome-gnome-shell"
        gnome.gnome-boxes
        gnome.gnome-tweaks
        mpv
    ];

    # Install recommended fonts
    fonts.fonts = with pkgs; [
        font-awesome
        noto-fonts-emoji
    ];

    # Set Alacritty as default terminal
    environment.sessionVariables.TERMINAL = [ "alacritty" ];

    # Firefox configurations
    nixpkgs.config.firefox = {
        enableGnomeExtensions = true;
        pipewireSupport = true;
    };
}
