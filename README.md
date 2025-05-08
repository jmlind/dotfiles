dotfiles
========

A collection of work and personal dotfiles.

Installation
------------

Clone the repo. 


### Using [GNU Stow](https://www.gnu.org/software/stow/) _(recommended)_

Install GNU Stow _(if not already installed)_

    Mac:      brew install stow
    Ubuntu:   apt-get install stow
    Fedora:   yum install stow
    Arch:     pacman -S stow
    Nix:      nix-shell -p stow

Then simply use `stow` from the repo to install the dotfiles you want to use:

    stow nvim
    stow tmux

Alternatively, you can run `./install.sh` and get prompted for each item.
