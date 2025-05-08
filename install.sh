#!/usr/bin/env bash
set -e

if ! command -v stow &> /dev/null; then
	printf "\e[31m[$0]: stow not found. Aborting... \e[0m\n"
	exit 1
fi

user=`whoami`
echo "[$0]: Installing dotfiles for $user into $HOME"

for dir in */; do
	dirname=${dir%/}
	read -p "Install $dirname? (Y/n): " response

	if [[ "$response" =~ ^[Yy]$ ]]; then
		stow -v $dirname
	fi
done

if [ ! -d ~/.config/tmux/plugins/catppuccin ]; then
	read -p "Install catppuccin tmux theme? (Y/n): " response
	if [[ "$response" =~ ^[Yy]$ ]]; then
		mkdir -p ~/.config/tmux/plugins/catppuccin
		git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
	fi
fi

echo "Finished installing config files"
