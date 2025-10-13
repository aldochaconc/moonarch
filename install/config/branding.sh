#!/bin/bash
# Copies the branding assets into the ~/dotfiles directory.

# Source presentation and logging helpers
source "$OMARCHY_INSTALL/helpers/presentation.sh"
source "$OMARCHY_INSTALL/helpers/logging.sh"

echo_subsection "Deploying Branding Assets"

mkdir -p "$HOME/dotfiles/branding"

log_info "Copying branding assets to ~/dotfiles/branding/"
cp "$OMARCHY_PATH/icon.txt" "$HOME/dotfiles/branding/about.txt"
cp "$OMARCHY_PATH/logo.txt" "$HOME/dotfiles/branding/screensaver.txt"
log_success "Branding assets deployed."
