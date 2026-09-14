cat << 'EOF' > ~/dotfiles/README.md
# Minimal Dark Hyprland Dotfiles

A stripped-down, bloat-free configuration for Hyprland on Arch / CachyOS. It replaces bloated multi-theme switchers with a fixed, minimalist aesthetic: solid dark backgrounds (`#111111`), crisp white typography, small 8pt JetBrainsMono Nerd Font text, and compact layouts.

## Features

- **Notifications (Dunst):** Lightweight popups styled with JetBrainsMono Nerd Font 8, tight padding, and a solid dark palette (replaces heavy SwayNC sidebars).
- **Application Launcher (Rofi):** Custom 4-column compact launchpad with vertical scrolling, 32px icons, and no transparent/glass blur.
- **Top Bar (Waybar):** Clean, essential indicators tuned for productivity.
- **Terminal (Kitty):** Monochrome dark profile aligned with the system palette.

---

## Installation Guide (Option 1 - HyDE Base)

This configuration relies on the underlying shell scripts, Wayland dispatchers, and helper utilities provided by the **[HyDE Project](https://github.com/hyde-project/hyde)** (e.g., `rofilaunch`, volume/brightness hooks, and monitor helpers). 

To ensure all required dependencies and scripts are properly present, follow this two-step install:

### 1. Fresh System & HyDE Setup
1. Install **CachyOS** (or Arch Linux).
2. Install the base HyDE environment by following their official installation:
``bash
git clone --depth 1 https://github.com/hyde-project/hyde ~/HyDE
cd ~/HyDE/Scripts
./install.sh
``

*(This ensures all media hooks, Wayland protocols, and core binaries are installed.)*

### 2. Apply Custom Dotfiles
Immediately after the HyDE setup finishes, apply this repo to strip the theme bloat, mask conflicting daemons, and lock in your minimalist setup:
``bash
git clone https://github.com//dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
``

### 3. Reload
Reload Hyprland or log out and log back in:
``bash
hyprctl reload
``

---

## Credits & Acknowledgements

- Built on top of the backend tools and architecture created by the **[HyDE Project](https://github.com/hyde-project/hyde)**. Huge credits to their team for maintaining the core Wayland scripts and helper dispatchers.
- Typography: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/).
EOF
