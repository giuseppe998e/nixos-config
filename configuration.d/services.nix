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
    };
}
