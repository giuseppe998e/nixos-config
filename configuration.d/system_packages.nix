{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        alacritty
        firefox-devedition-bin
        git
        htop
        neovim
    ];
}
