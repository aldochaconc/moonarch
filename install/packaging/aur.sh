#!/bin/bash

# Install AUR packages by first installing yay, then using yay to install the rest
mapfile -t packages < <(grep -v '^#' "$MOONARCH_INSTALL/aur.packages" | grep -v '^$')

if [[ ${#packages[@]} -eq 0 ]]; then
    echo "No AUR packages to install"
    return 0
fi

# Check if we have internet connectivity (required for AUR)
if ! ping -c 1 8.8.8.8 >/dev/null 2>&1; then
    echo "No internet connectivity - skipping AUR package installation"
    echo "AUR packages will need to be installed manually after system setup"
    return 0
fi

echo "Installing AUR packages: ${packages[*]}"

# Ensure build dependencies are installed
echo "Installing build dependencies for AUR packages..."
# Ensure yay is installed (should be pre-installed from ISO)
if ! command -v yay &> /dev/null; then
    echo "yay not found, attempting to install from pacman cache..."
    
        echo "Installing yay AUR helper from source..."
        
        # Create temporary directory for building yay
        YAY_BUILD_DIR="/tmp/yay-build"
        rm -rf "$YAY_BUILD_DIR"
        mkdir -p "$YAY_BUILD_DIR"
        cd "$YAY_BUILD_DIR"
        
        # Clone yay source
        git clone https://aur.archlinux.org/yay.git .
        
        # Build and install yay
        makepkg -si --noconfirm
        
        # Clean up
        cd /
        rm -rf "$YAY_BUILD_DIR"
fi

# Install all AUR packages using yay
for package in "${packages[@]}"; do
    if [[ "$package" == "yay" ]]; then
        # Skip yay as it's already installed above
        continue
    fi
    
    echo "Installing AUR package: $package"
    yay -S --noconfirm --needed "$package"
done

echo "AUR packages installation completed"
