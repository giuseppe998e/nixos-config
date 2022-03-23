{ config, lib, pkgs, ... }:

{
    hardware = {
        enableRedistributableFirmware = true;
        cpu.intel.updateMicrocode = true;
        video.hidpi.enable = false;
        opengl = {
            enable = true;
            extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau intel-ocl ];
        };
    };
}
