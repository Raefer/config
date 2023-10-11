# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Add Gradle to $PATH
export PATH=$PATH:/home/raefer/..gradle/gradle-8.3/bin

# Set dynamic library path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/

# Cargo
. "$HOME/.cargo/env"

# ALIAS
alias t=tmux
alias n=nvim
alias q=exit
# standard util replacement
alias ls=exa
alias cat=bat
# config page
alias cn="nvim ~/.config/nvim/"
# Neorg
alias journal="nvim -c \"Neorg journal today\""
alias notes="nvim -c \"Neorg workspace notes\""

# Remove VSCode's csdevkit and Library folder, cuz it's completely empty, and clutter the $HOME
rm -rf $HOME/csdevkit $HOME/Library
