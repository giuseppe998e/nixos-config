{ pkgs, ... }:

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
            desktopManager.gnome = {
                enable = true;
                games.enable = false;
                excludePackages = [
                    pkgs.gnome.cheese
                    pkgs.gnome-photos
                    pkgs.gnome.gnome-music
                    pkgs.gnome.gnome-terminal
                    pkgs.gnome.gnome-characters
                    pkgs.gnome.totem
                    pkgs.gnome.tali
                    pkgs.gnome.iagno
                    pkgs.gnome.hitori
                    pkgs.gnome.atomix
                    pkgs.gnome-tour
                    pkgs.gnome.geary
                    pkgs.epiphany
                ];
            };
        };
    };
}
