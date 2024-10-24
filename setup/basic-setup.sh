#!/usr/bin/env zsh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo Running apt-get update and upgrade
apt-get update & apt-get upgrade

echo Installing basic apt-get stuff
apt-get install build-essential procps curl wget file git tmux brave-browser alacritty zsh

echo Setting zsh as default shell
chsh -s $(which zsh)
