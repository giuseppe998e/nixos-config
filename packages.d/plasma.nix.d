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
            desktopManager.plasma5 = {
                enable = true;
                useQtScaling = false; # HiDPI
                runUsingSystemd = true;
            };
        };
    };

    environment = {
        systemPackages = with pkgs; [
            # Plasma
            kde-gtk-config

            # Others
            alacritty
            firefox
            mpv
        ];

        sessionVariables = {
            TERMINAL = "alacritty";
            #EDITOR = "";
        };
    };

    # Enable networking
    networking.networkmanager.enable = true;

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
