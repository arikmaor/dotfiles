#!/bin/sh

# install apple dev tools
xcode-select --install

# Getting the repo
git clone https://github.com/arikmaor/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

