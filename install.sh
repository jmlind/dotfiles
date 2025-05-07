#!/usr/bin/env bash
set -e

if ! command -v stow &> /dev/null; then
	printf "\e[31m[$0]: stow not found. Aborting... \e[0m\n"
	exit 1
fi

user=`whoami`
echo "Installing dotfiles for $user into $HOME"

# stow using dotfiles syntax, transforming dot- prefixed directories to .<dir> 
stow -Rv --dotfiles -t ~/ .

# todo
# test .config
# test .tmux.conf

if [ ! -d ~/.config/tmux/plugins/catppuccin ]; then
	printf "[$0]: catppuccin tmux theme not found. Installing..."
	mkdir -p ~/.config/tmux/plugins/catppuccin
	git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
fi

echo "Finished installing config files"
