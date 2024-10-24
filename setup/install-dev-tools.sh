#!/usr/bin/env zsh

echo Installing homebrew...
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo Installing tools with homebrew...
brew install gcc
brew install antigen
brew install fzf
brew install ripgrep
brew install z
brew install tig
brew install hub
brew install gh
brew install the_silver_searcher
brew install fd
brew install ranger
brew install jq
brew install htop
brew install btop
brew install neovim
brew install nvm
brew install tfenv
brew install pyenv
brew install watch
brew install stern
brew install kubernetes-cli
brew install kubectx
brew install lazygit
brew install k3d
brew install fnm
brew install mongosh
brew install youtube-dl
brew install temporal

echo Installing docker...
/bin/bash -c "$(https://get.docker.com)"

