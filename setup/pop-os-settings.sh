# Set small dock size
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 36

# Center clock
dconf write /org/gnome/shell/extensions/pop-cosmic/clock-alignment '"CENTER"'

# Show all button on app titles
dconf write /org/gnome/desktop/wm/preferences/button-layout '"appmenu:minimize,maximize,close"'

# Put dock on the left
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position '"LEFT"'

# Auto hide dock
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed false
dconf write /org/gnome/shell/extensions/dash-to-dock/intellihide false

# Display dock on all monitors
dconf write /org/gnome/shell/extensions/dash-to-dock/multi-monitor true

# Set default apps (always appears in the dock)
dconf write /org/gnome/shell/favorite-apps '["org.gnome.Nautilus.desktop", "com.alacritty.Alacritty.desktop", "brave-browser.desktop"]'

# Enable workspace only on primary display
dconf write /org/gnome/mutter/workspaces-only-on-primary true

# Disable power button
dconf write /org/gnome/settings-daemon/plugins/power/power-button-action '"nothing"'

# Show battery percentage
dconf write /org/gnome/desktop/interface/show-battery-percentage true

# Add hebrew input language
dconf write /org/gnome/desktop/input-sources/sources '[("xkb", "us"), ("xkb", "il")]'

# Switch input language for each window
dconf write /org/gnome/desktop/input-sources/per-window true

# Switch input source keybinding
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source-backward '["<Primary><Shift>space"]'
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source '["<Primary>space"]'

# Disable window menu keybinding
dconf write /org/gnome/desktop/wm/keybindings/activate-window-menu '@as []'

# Enable tiling
dconf write /org/gnome/mutter/edge-tiling false
dconf write /org/gnome/shell/extensions/pop-shell/tile-by-default true
dconf write /org/gnome/shell/extensions/pop-shell/gap-inner 'uint32 1'
dconf write /org/gnome/shell/extensions/pop-shell/gap-outer 'uint32 1'
dconf write /org/gnome/shell/extensions/pop-shell/active-hint true
dconf write /org/gnome/shell/extensions/pop-shell/hint-color-rgba '"rgb(21,16,112)"'
