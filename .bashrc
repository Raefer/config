#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


### CUSTOM ###

# customize prompt
source ~/.git-prompt.sh

GRY_PROMPT="\[\033[2;37m\]"
RED_PROMPT="\[\033[0;31m\]"
GRN_PROMPT="\[\033[0;32m\]"
YEL_PROMPT="\[\033[0;33m\]"
BLU_PROMPT="\[\033[0;36m\]"
BLK_PROMPT="\[\033[0m\]"

get_return_value() {
    if [ $? = 0 ]; then 
        echo "$GRN_PROMPT✔"; 
    else 
        echo "$RED_PROMPT✘"; 
    fi
}

# PS1="[\u@\h \W]\$ " # default prompt
# PS1="\[\033[1;32m\][\u@\h:\w]\\$\[\033[0m\] " # nixos prompt

PROMPT_COMMAND='PS1=" $(get_return_value) $BLU_PROMPT\w$(__git_ps1) $GRY_PROMPT»$BLK_PROMPT "'
PS2=" > "

# path for cargo, scripts, and local bin
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/scripts:$PATH"
PATH="$HOME/.local/bin:$PATH"
export PATH

# for some reason these stuffs keep coming back
if [[ -f $HOME/.local/share/recently-used.xbel ]]; then
    rm $HOME/.local/share/recently-used.xbel
fi

# UNWANTED_DIR=(
#    "Desktop"
#    "Downloads"
#    "Documents"
#    "Music"
#    "Pictures"
#    "Public"
#    "Templates"
#    "Videos"
# )
#
# for item in "${UNWANTED_DIR[@]}"; do
#     if [[ -d $HOME/$item ]]; then
#         rmdir $HOME/$item
#     fi
# done

# Unix tool replacement
alias cat="bat"
alias ls="eza"

# lazy command
alias l="ls -l"
alias editsnippets="nvim ~/.config/nvim/lua/config/snippets.lua"
alias notes="cd ~/notes/ && nvim ."

# print reminder
alias reminder="echo '>> cat -p ~/documents/reminder.txt' && cat -p ~/documents/reminder.txt"

# clear command
alias clear="clear -x"

