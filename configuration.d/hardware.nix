{ config, lib, pkgs, ... }:

{
    hardware = {
        cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        video.hidpi.enable = true;
        pulseaudio.enable = false; # Required for PipeWire (hardware.nix)
        opengl = {
            enable = true;
            extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau intel-ocl ];
        };
    };
}
