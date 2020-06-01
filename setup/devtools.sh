# install nvm and latest node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts

# install fonts for iterm
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# install iterm
ITERM_SYNC_DIR="${HOME}/.dotfiles/iterm"
brew cask install iterm2
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool TRUE
defaults write com.googlecode.iterm2 PrefsCustomFolder $ITERM_SYNC_DIR

brew install zsh
brew install trash
brew install tmux
brew install z
brew install wget
brew install antigen
brew install direnv
brew install hub
brew install jq
brew install htop
brew install fzf

brew cask install docker