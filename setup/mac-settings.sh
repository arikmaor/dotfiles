# Disable natural scroll
defaults write 'Apple Global Domain' com.apple.swipescrolldirection -bool false

# Set fastest tracking speed
defaults write 'Apple Global Domain' com.apple.trackpad.scaling -float 3

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

# Show bluetooth menu
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

# Show battery precentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Show volume in menubar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Volume.menu"f

# Restart ui
for app in \
  "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &>/dev/null
done
