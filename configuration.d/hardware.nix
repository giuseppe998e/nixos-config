{
    hardware = {
        cpu.intel.updateMicrocode = true;
        video.hidpi.enable = true;
        pulseaudio.enable = false; # Required for PipeWire (hardware.nix)
        opengl.enable = true;
    };
}