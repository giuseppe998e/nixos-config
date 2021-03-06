{
    nix = {
        # Trusted users
        trustedUsers = [ "@wheel" ];

        # Auto optimize store
        autoOptimiseStore = true;

        # Garbage collector
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
        extraOptions = ''
            keep-outputs = true
            keep-derivations = true
        '';
    };

    nixpkgs = {
        config.allowUnfree = true;
    };
}
