#!/bin/bash
# Copies theme assets into the ~/dotfiles directory and sets the initial theme.

# Source presentation and logging helpers
source "$OMARCHY_INSTALL/helpers/presentation.sh"
source "$OMARCHY_INSTALL/helpers/logging.sh"

echo_subsection "Deploying Themes"

# --- Step 1: Copy Theme Assets ---
mkdir -p "$HOME/dotfiles/themes"
log_info "Copying all themes to ~/dotfiles/themes/"
cp -rT "$OMARCHY_PATH/themes/" "$HOME/dotfiles/themes/"
log_success "Themes copied successfully."

# --- Step 2: Copy Walker Themes ---
# Walker has its own theme structure within dotfiles
mkdir -p "$HOME/dotfiles/walker/themes"
log_info "Copying walker themes to ~/dotfiles/walker/themes/"
# Ensure the source directory exists before copying
if [ -d "$OMARCHY_PATH/dotfiles_template/walker/themes" ]; then
    cp -rT "$OMARCHY_PATH/dotfiles_template/walker/themes/" "$HOME/dotfiles/walker/themes/"
    log_success "Walker themes copied successfully."
else
    log_info "No walker themes found in template, skipping."
fi

# --- Step 3: Set Initial Theme ---
# This creates the 'current' symlink that all configs point to.
log_info "Setting initial theme to kanagawa-dark"
ln -snf "$HOME/dotfiles/themes/kanagawa-dark" "$HOME/dotfiles/themes/current"
# Create a link for the background for apps that need a direct path
ln -snf "$HOME/dotfiles/themes/current/backgrounds/1-kanagawa.jpg" "$HOME/dotfiles/themes/current/background"
log_success "Initial theme set."
