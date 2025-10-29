# Disable natural scroll
defaults write 'Apple Global Domain' com.apple.swipescrolldirection -int 0

# Set fastest tracking speed
defaults write 'Apple Global Domain' com.apple.trackpad.scaling -string 3

# Set fastest key repeat
defaults write 'Apple Global Domain' InitialKeyRepeat -int 15
defaults write 'Apple Global Domain' KeyRepeat -int 2

# Enable "tap to click"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Enable swipe down gesture (App Expose)
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Set dock icons size
defaults write com.apple.dock tilesize -int 38

# Enable dock icons magnification
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 104

# Show battery precentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Restart ui
for app in \
  "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &>/dev/null
done
