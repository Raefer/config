{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        gcc		# c/c++ compiler
        gh 		# github cli tool
        git		# version control
        gnumake	# make tool
        ntfs3g  # ntfs utility
        tmux	# terminal multiplexer
        wget    # get

        # Neovim
        neovim
        # image support
        imagemagick
        # LSPs
        lua-language-server
        bash-language-server
        # FMT
        stylua
    ];

    programs.neovim = {
        defaultEditor = true;
    };

}
