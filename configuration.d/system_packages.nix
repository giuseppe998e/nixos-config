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
            enableAutosuggestions = true;
            enableSyntaxHighlighting = true;
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
