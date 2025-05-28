{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        # Replacement Programs
        # bat     # replacement for cat
        btop    # replacement for htop
        eza     # replacement for ls
        hyfetch	# replacement for neofetch

        # Utility Programs
        exiftool    # exif viewer
        feh		    # image viewer
        ffmpeg      # video processing
        htop	    # process monitor
        ncdu	    # disk usage analyser
        pulsemixer  # volume control
        unzip       # unzip
        yazi        # terminal file manager
        yt-dlp      # youtube video download
        zip         # zip

        # Dependencies
        file                # file type viewer, dependency for yazi
        lxmenu-data         # menu data, dependency for pcmanfm
        shared-mime-info    # mime types, dependency for pcmanfm

        ########################################################################

        # Basic Programs
        kitty       # terminal emulator
        krusader    # dual-pane file manager
        pcmanfm     # file manager
        vlc		    # media player

        # Utility Programs
        anki-bin            # spaced repitition system (`anki` package out of date)
        gnucash	            # accounting
        libreoffice         # office suite
        qalculate-gtk       # calculator
        telegram-desktop	# telegram
        zathura             # pdf viewer

        # Creative Programs
        darktable	# non-destructive photo editor
        inkscape    # vector graphic editor
        krita       # painting application

        # Security
        chkrootkit  # rootkit checker
        lynis       # security auditing tool

        # Dependencies
        mplayer     # media player, dependency for anki-bin
        kdiff3      # diff utility, dependency for krusader
        krename     # rename utility, dependency for krusader
        gamemode    # optimize performance for games, dependency for steam
        hunspell    # spellchecker and dictionaries, dependency for libreoffice
        hunspellDicts.en_US
        hunspellDicts.en_CA
        hunspellDicts.en_AU
        hunspellDicts.en_GB-large
        hunspellDicts.de_DE
    ];

    programs.bat = {
        enable = true;
        settings = {
            style = "plain";
            paging = "never";
        };
    };

    programs.firefox = {
        enable = true;
    };

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
}
