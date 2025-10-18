#!/bin/bash

# Install all base packages
mapfile -t packages < <(grep -v '^#' "$MOONARCH_INSTALL/base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
