#!/bin/bash

# Clear workspace switching keybindings
for i in {1..5}; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "[]"
done

# Clear focus movement keybindings
gsettings set org.gnome.desktop.wm.keybindings move-focus-left "[]"
gsettings set org.gnome.desktop.wm.keybindings move-focus-right "[]"
gsettings set org.gnome.desktop.wm.keybindings move-focus-up "[]"
gsettings set org.gnome.desktop.wm.keybindings move-focus-down "[]"

# Clear window movement keybindings
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "[]"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "[]"

# Clear window-to-workspace keybindings
for i in {1..5}; do
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "[]"
done

# Clear close window keybinding
gsettings set org.gnome.desktop.wm.keybindings close "[]"

# Clear normal behavior of super-key
gsettings set org.gnome.shell.keybindings toggle-overview "[]"

echo("cleared conflicting bindings")

echo("starting setting up fammiliar bindings")

# Open Ghostty Terminal with Super + Enter
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Open Ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Switch Workspaces with Super + 1-5
for i in {1..5}; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done

# Switch Focus with Super + hjkl
gsettings set org.gnome.desktop.wm.keybindings move-focus-left "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings move-focus-right "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings move-focus-up "['<Super>k']"
gsettings set org.gnome.desktop.wm.keybindings move-focus-down "['<Super>j']"

# Move Windows with Super + Shift + hjkl
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Super><Shift>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Super><Shift>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Super><Shift>k']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "['<Super><Shift>j']"

# Send Windows to Workspaces with Super + Shift + 1-5
for i in {1..5}; do
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done

# Close Current Application with Super + q
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"

# Open application view with super + space
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Super>space']"


