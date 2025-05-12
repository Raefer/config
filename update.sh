#!/bin/bash

config_items=(
    ".config/alacritty"
    ".config/feh"
    ".config/kitty"
    ".config/nvim"
    ".config/sway"
    ".config/tmux"
    ".config/waybar"
    ".config/wofi"
)

cp -r ~/nixos .

mkdir -p ./.config

for item in "${config_items[@]}"; do
    cp -r $HOME/$item ./.config
done
