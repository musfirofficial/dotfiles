#!/usr/bin/env bash
set -e

echo "==> Installing necessary packages..."
sudo pacman -S --needed --noconfirm dunst rofi-wayland waybar kitty ttf-jetbrains-mono-nerd libnotify

echo "==> Masking conflicting SwayNC..."
systemctl --user stop swaync 2>/dev/null || true
systemctl --user mask swaync 2>/dev/null || true

echo "==> Applying configurations..."
mkdir -p ~/.config/hypr ~/.config/dunst ~/.config/rofi ~/.config/waybar ~/.config/kitty ~/.local/share/rofi/themes ~/.local/bin

# Hyprland configs
cp -rf config/hypr/* ~/.config/hypr/ 2>/dev/null || true

# Waybar setup & custom styling
cp -rf config/waybar/* ~/.config/waybar/ 2>/dev/null || true

# Kitty terminal config
cp -rf config/kitty/* ~/.config/kitty/ 2>/dev/null || true

# Dunst compact theme
cp -f config/dunst/dunstrc ~/.config/dunst/ 2>/dev/null || true

# Rofi dark theme, 4-col launchpad, and 3x2 powermenu
cp -f config/rofi/theme.rasi ~/.config/rofi/ 2>/dev/null || true
[ -f config/rofi/powermenu.rasi ] && cp -f config/rofi/powermenu.rasi ~/.config/rofi/powermenu.rasi
[ -f rofi-themes/launchpad.rasi ] && cp -f rofi-themes/launchpad.rasi ~/.local/share/rofi/themes/launchpad.rasi

# Powermenu binary & overrides
if [ -f bin/powermenu ]; then
cp -f bin/powermenu ~/.local/bin/powermenu
chmod +x ~/.local/bin/powermenu
ln -sf ~/.local/bin/powermenu ~/.local/bin/logoutlaunch
ln -sf ~/.local/bin/powermenu ~/.local/bin/wlogout
fi

echo "==> Setup complete! Reload Hyprland or log out and back in."
