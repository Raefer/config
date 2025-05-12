{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        # Components
        sway 	# compositor
        swaybg 	# background
        waybar 	# status bar
        wofi   	# launcher
        grim	# screenshot utiil
        # Theming
        nwg-look	# gtk3 theming
        # gnome-themes-extra

        # slurp
        # wl-clipboard
        # mako
    ];

    services.gnome.gnome-keyring.enable = true;

    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };
}
