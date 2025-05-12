{ config, pkgs, lib, ... }:
{
    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.waylandFrontend = true;
        fcitx5.addons = with pkgs; [
            fcitx5-gtk
            fcitx5-anthy
            fcitx5-chewing
        ];
    };

    fonts = {
        enableDefaultPackages = true;
        packages = with pkgs; [
            # (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
            nerd-fonts.jetbrains-mono
            source-han-sans 
        ];

        fontconfig = {
            defaultFonts = {
                serif = [ "FreeSerif" "source-han-sans" ];
                sansSerif = [ "FreeSans" "source-han-sans" ];
                monospace = [ "JetBrainsMono Nerd" ];
            };
        };
    };
}
