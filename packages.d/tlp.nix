{
    services.tlp = {
        enable = true;
        settings = {
            # Battery care
            START_CHARGE_THRESH_BAT1 = 65;
            STOP_CHARGE_THRESH_BAT1  = 81;

            # CPU Governor (AC)
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

            # CPU Governor (BAT)
            CPU_SCALING_GOVERNOR_ON_AC = "powersave";
            CPU_ENERGY_PERF_POLICY_ON_AC = "power";
            
            # Bluetooth
            DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
            DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE = "bluetooth";
        };
    };
}
