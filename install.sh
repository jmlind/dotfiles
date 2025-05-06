#!/usr/bin/env bash
set -e

if ! command -v stow &> /dev/null; then
	printf "\e[31m[$0]: stow not found. Aborting... \e[0m\n"
	exit 1
fi

user=`whoami`
echo "Installing dotfiles for $user into $HOME"

# clone dotfiles repo
# git clone https://github.com/jmlind/dotfiles $HOME/dotfiles

pushd $HOME/dotfiles

# make directories
if [ ! -d $HOME/.config/ ]; then
	mkdir -p $HOME/.config/ &>/dev/null
fi

if [ ! -d .config/ ]; then
	echo "for some reason this isn't executing from the dotfiles repo. cannot continue"
	exit 1
fi

# stow config
stow -Rv -t $HOME/.config/ .config


# symlink zshrc
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc

popd

echo "Finished installing config files"
