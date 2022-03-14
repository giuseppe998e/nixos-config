{ config, pkgs, ... }:

with builtins;
with import <nixpkgs> {};
with lib;

let
    # Returns all ".nix" files in a directory
    listConfig = dir: map (name: dir + "/${name}")
        (attrValues (filterAttrs
            (name: _: hasSuffix ".nix" name)
            (readDir dir)
        ));
in
{
    # Imports all sub-configurations in "configuration.d"
    imports = listConfigs ./configuration.d;
}
