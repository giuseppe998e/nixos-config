{
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        #jack.enable = true;
    };

    # Required
    hardware.pulseaudio.enable = false;

    # Recommended
    security.rtkit.enable = true;
}
