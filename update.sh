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

mkdir -p ./.config
mkdir -p ./.mozilla/firefox/xxxxxxxx.default/

for item in "${config_items[@]}"; do
    cp -r $HOME/$item ./.config
done

cp -r ~/.mozilla/firefox/5e801ax6.default/prefs.js ./.mozilla/firefox/xxxxxxxx.default/
cp -r ~/.mozilla/firefox/5e801ax6.default/places.sqlite ./.mozilla/firefox/xxxxxxxx.default/

cp -r ~/nixos .

