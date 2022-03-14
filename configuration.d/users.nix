{ config, ... }:

{
    users = {
        mutableUsers = false;
        users = {
            giuseppe = {
                isNormalUser = true;
                extraGroups = [ "wheel" ];
                # nix-shell --run 'mkpasswd -m SHA-512 -s' -p mkpasswd
                initialHashedPassword = "$6$tbYpKD3PosgOcbK1$5FoYw43CN7KaRgAcgzLsCsTB3ooV1gTmOFSdKEZmbNV0SbrdqBqK1Bqxf/g4hmut.6I1Kl71UJgkKMyd1x2WP1";
            };
        };
    };
}
