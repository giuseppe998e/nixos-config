{ config, pkgs, ... }:

with builtins;
with import <nixpkgs> {};
with lib;

let
    # Returns all ".nix" files in a directory
    listConfig = dir: map (name: dir + "/${name}")
        (attrNames (filterAttrs
            (name: _: hasSuffix ".nix" name)
            (readDir dir)
        ));
in
{
    # Sub-Configurations
    imports = (listConfig ./configuration.d)
            ++ (listConfig ./packages.d);

    # TimeZone
    time.timeZone = "Europe/Rome";

    # Internationalization properties
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "it";

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "21.11"; # Did you read the comment?
}
