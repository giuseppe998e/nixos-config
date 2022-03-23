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

            # Sddm Display Manager
            displayManager.sddm = {
                enable = true;
                settings = {
                    Wayland.SessionDir = "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
                };
            };

            # Plasma Desktop Environment
            desktopManager.plasma5.enable = true;
        };
    };

    environment = {
        systemPackages = with pkgs; [
            # Plasma
            oxygen_gtk

            # Others
            alacritty
            firefox
            celluloid
        ];

        shellInit = ''
            export GTK_PATH=$GTK_PATH:${pkgs.oxygen_gtk}/lib/gtk-2.0
            export GTK2_RC_FILES=$GTK2_RC_FILES:${pkgs.oxygen_gtk}/share/themes/oxygen-gtk/gtk-2.0/gtkrc
        '';

        sessionVariables = {
            TERMINAL = "alacritty";
            EDITOR = "gedit";
        };
    };

    # Install recommended fonts
    fonts.fonts = with pkgs; [
        font-awesome
        noto-fonts-emoji
    ];

    # Firefox configurations
    nixpkgs.config.firefox = {
        pipewireSupport = true;
    };
}
