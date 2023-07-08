# install fonts for iterm
echo "Installing fonts for iterm"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install --cask google-chrome
brew install --cask dropbox
brew install --cask google-drive
brew install --cask java
brew install --cask the-unarchiver
brew install --cask whatsapp
brew install --cask karabiner-elements
brew install --cask vlc
brew install --cask appcleaner
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask zoomus
brew install --cask figma
