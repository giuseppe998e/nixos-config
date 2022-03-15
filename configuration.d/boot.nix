{ pkgs, ... }:

{
    boot = {
        # Kernel version
        kernelPackages = pkgs.linuxPackages_latest;

        # Modules that are always loaded by the kernel
        #kernelModules = [ ];

        # Kernel boot parameters
        #kernelParams = [ ];

        # Runtime parameters of the Linux kernel, as set by sysctl
        kernel.sysctl = {
            "vm.swappiness" = 10;
        };

        # Device for manual resume attempt during boot
        #resumeDevice = "/dev/*TBD*";

        # Extra configurations for the generated "modprobe.conf"
        extraModprobeConfig = ''
            options i915 modeset=1 enable_fbc=1 enable_guc=2
            options snd_hda_intel power_save=1
        '';

        # Initial ramdisk
        initrd = {
            # The set of kernel modules in the initial ramdisk used during the boot process
            availableKernelModules = [ ];

            # Names of supported filesystem types in the initial ramdisk
            supportedFilesystems = [ "btrfs" "tmpfs" ];

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
