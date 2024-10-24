#!/usr/bin/env bash

set -eo pipefail

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# brave-browser
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo Running apt update and upgrade
apt update & apt upgrade -y

echo Installing basic apt-get stuff
apt install -y build-essential procps curl wget file git tmux brave-browser alacritty zsh stow

echo Setting zsh as default shell for root
chsh -s $(which zsh)

echo 'Run this now (without sudo) to set zsh as the default shell:'
echo "  chsh -s $(which zsh)"

echo 'Run this to install homebrew:'
echo '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
