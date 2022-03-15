{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        firefox-devedition-bin
        alacritty
        neovim
        htop
        git
    ];
}
