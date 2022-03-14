{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        firefox-devedition-bin
        neovim
        git
    ];
}
