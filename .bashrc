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
export PATH=$PATH:/home/raefer/.gradle/gradle-8.3/bin

# Add JDTLS to $PATH
export PATH=$PATH:/home/raefer/.lspservers/jdtls/bin

# Set dynamic library path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/


. "$HOME/.cargo/env"
