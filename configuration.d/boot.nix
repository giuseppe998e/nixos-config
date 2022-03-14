{ pkgs, ... }:

{
    boot = {
        # Kernel version
        kernelPackages = pkgs.linuxPackages_latest;

        # Modules that are always loaded by the kernel
        #kernelModules = [ ];

        # Kernel boot parameters
        kernelParams = [
            #"resume=/dev/*TBD*"
        ];

        # Extra configurations for the generated "modprobe.conf".
        extraModprobeConfig = ''
            options i915 modeset=1 enable_fbc=1 enable_guc=2
            options snd_hda_intel power_save=1
        '';

        # Initial ramdisk
        initrd = {
            # The set of kernel modules in the initial ramdisk used during the boot process.
            # This set must include all modules necessary for mounting the root device
            availableKernelModules = [ ];

            # Modules that are always loaded by the initrd
            #kernelModules = [ ];
        };

        # Boot loader (GRUB)
        loader = {
            efi.canTouchEfiVariables = true;
            grub = {
                enable = true;
                efiSupport = true;
                devices = [ "nodev" ];
            };
        };
    };
}
