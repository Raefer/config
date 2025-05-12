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

        # Dependencies
        file                # file type viewer, dependency for yazi
        lxmenu-data         # menu data, dependency for pcmanfm
        shared-mime-info    # mime types, dependency for pcmanfm

        ########################################################################

        # Basic Programs
        kitty       # terminal emulator
        pcmanfm     # file manager
        vlc		    # media player

        # Utility Programs
        anki-bin            # spaced repitition system (`anki` package out of date)
        gnucash	            # accounting
        libreoffice         # office suite
        qalculate-gtk       # calculator
        telegram-desktop	# telegram

        # Creative Programs
        darktable	# non-destructive photo editor
        krita       # painting application

        # Security
        lynis       # security auditing tool
        ossec-agent # intrusion detection system

        # Dependencies
        mplayer     # media player, dependency for anki-bin
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
