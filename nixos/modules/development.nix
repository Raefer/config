{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        gcc		# c/c++ compiler
        gh 		# github cli tool
        git		# version control
        gnumake	# make tool
        neovim 	# editor
        ntfs3g  # ntfs utility
        tmux	# terminal multiplexer
        wget    # get
        # LSPs
        bash-language-server
        lua-language-server
    ];

    programs.neovim = {
        defaultEditor = true;
    };

}
