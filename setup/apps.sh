# install fonts for iterm
echo "Installing fonts for iterm"
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

brew cask install google-chrome
brew cask install dropbox
brew cask install google-drive
brew cask install java
brew cask install the-unarchiver
brew cask install whatsapp
brew cask install vlc
brew cask install appcleaner
brew cask install slack
brew cask install visual-studio-code
brew cask install zoomus