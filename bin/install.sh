#!/usr/bin/env bash
set -e

echo "Installing dotfiles..."
read -p "Which user? " user

# clone dotfiles repo
# git clone https://github.com/jmlind/dotfiles /home/$user/dotfiles

pushd /home/$user/dotfiles

# make directories
mkdir -p /home/$user/.config/nvim &>/dev/null

# stow nvim config
stow -Rv -t /home/$user/.config/nvim nvim

# symlink zshrc
ln -sf /home/$user/dotfiles/.zshrc ~/.zshrc

# symlink starship.toml
ln -sf /home/$user/dotfiles/starship.toml ~/.config/starship.toml

popd

echo "Finished installing config files"
