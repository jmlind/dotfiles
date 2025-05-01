#!/usr/bin/env bash
set -e

if ! command -v stow 2>&1; then
	printf "\e[31m[$0]: stow not found. Aborting... \e[0m\n"
	exit 1
fi

user=`whoami`
echo "Installing dotfiles for $user"

# clone dotfiles repo
# git clone https://github.com/jmlind/dotfiles /home/$user/dotfiles

pushd /home/$user/dotfiles

# make directories
mkdir -p /home/$user/.config/nvim &>/dev/null
mkdir -p /home/$user/.config/kitty &>/dev/null

# stow nvim config
stow -Rv -t /home/$user/.config/nvim nvim

# stow kitty config
stow -Rv -t /home/$user/.config/kitty kitty

# symlink zshrc
ln -sf /home/$user/dotfiles/.zshrc ~/.zshrc

# symlink starship.toml
ln -sf /home/$user/dotfiles/starship.toml ~/.config/starship.toml

popd

echo "Finished installing config files"
