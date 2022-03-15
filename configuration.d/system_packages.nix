{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        alacritty
        firefox-devedition-bin
        git
        htop
        neovim
    ];

    programs = {
        zsh = {
            enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
            history = {
                size = 10000;
                path = "${config.xdg.dataHome}/.zsh_hist";
            };
        };

        starship = {
            enable = true;
            settings = {
                directory.style = "bold blue";
                battery.disabled = true;
            };
        };
    };
}
