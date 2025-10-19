#!/bin/bash

# Install all aur packages
mapfile -t packages < <(grep -v '^#' "$MOONARCH_INSTALL/aur.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
