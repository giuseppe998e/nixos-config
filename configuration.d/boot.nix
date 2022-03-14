{
    boot = {
        # Kernel version
        kernelPackages = pkgs.linuxPackages_latest;

        # Kernel additional modules
        # kernelModules = [ ];

        # Kernel boot parameters
        kernelParams = [
            #"resume=/dev/*TBD*"
        ];

        # Extra configurations for the generated "modprobe.conf".
        extraModprobeConfig = ''
            options i915 modeset=1 enable_fbc=1 enable_guc=2
            options snd_hda_intel power_save=1
        '';

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
