#!/bin/sh

rm -rf ./.config/*
cp -r $HOME/.config/nvim/ ./.config/
cp -r $HOME/.config/tmux/ ./.config/
cp -r $HOME/.config/alacritty/ ./.config/
