{ config, pkgs, lib, ... }:
{
    programs.bash = {
        promptInit = ''
            # Provide a nice prompt if the terminal supports it.
            if [ "$TERM" != "dumb" ] || [ -n "$INSIDE_EMACS" ]; then
                PROMPT_COLOR="1;31m"
                ((UID)) && PROMPT_COLOR="1;32m"
                if [ -n "$INSIDE_EMACS" ]; then
                    # Emacs term mode doesn't support xterm title escape sequence (\e]0;)
                    PS1="\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
                else
                    PS1="\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
                fi
                if test "$TERM" = "xterm"; then
                    PS1="\[\033]2;\h:\u:\w\007\]$PS1"
                fi
            fi
        '';

        shellAliases = {
            # Shorthand
            q = "exit";
            pm = "pulsemixer";
            sdn = "shutdown now";
            # Behavior
            grep = "grep --color=always";
            ip = "ip --color";
            # Unix tool replacement
            ls = "eza --color=always --header --group";
            cat = "bat";
            htop = "btop";
        };

        loginShellInit = ''
            PATH="$HOME/script:$PATH"
            export PATH
        '';

        shellInit = ''
            if [[ -f $HOME/.local/share/recently-used.xbel ]]; then
                rm $HOME/.local/share/recently-used.xbel
            fi
            if [[ -d $HOME/Downloads ]]; then
                rmdir Downloads
            fi
        '';
    };
}
