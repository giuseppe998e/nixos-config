{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        git
        htop
        neovim
    ];

    programs = {
        zsh = {
            enable = true;
            sutosuggestions.enable = true;
            syntaxHighlighting.enable = true;
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
