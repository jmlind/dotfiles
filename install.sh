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

echo "Finished installing config files"
