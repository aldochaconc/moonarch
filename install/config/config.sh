#!/bin/bash
# Copies the dotfiles_template to the user's ~/dotfiles directory
# and then creates symlinks from ~/.config and ~/ to the files and directories
# within ~/dotfiles.

# Source presentation and logging helpers
source "$MOONARCH_INSTALL/helpers/presentation.sh"
source "$MOONARCH_INSTALL/helpers/logging.sh"

echo_section "Deploying Dotfiles"

# Ensure the ~/dotfiles and ~/.config directories exist
mkdir -p "$HOME/dotfiles"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.backups"

# --- Step 1: Copy Template to Dotfiles ---
echo_subsection "Copying template to ~/dotfiles"
log_info "Copying dotfiles template from $MOONARCH_PATH/dotfiles_template/ to $HOME/dotfiles/"
cp -rT "$MOONARCH_PATH/dotfiles_template/" "$HOME/dotfiles/"
log_success "Dotfiles template copied successfully."

# --- Step 2: Create Symlinks ---
echo_subsection "Creating symlinks"
for item in $(ls -A "$HOME/dotfiles"); do
    source_path="$HOME/dotfiles/$item"
    
    # Determine target path
    if [[ "$item" == .* ]]; then
        # This is a file/dir for the home directory (e.g., .bashrc)
        target_path="$HOME/$item"
    else
        # This is a file/dir for the .config directory (e.g., hypr)
        target_path="$HOME/.config/$item"
    fi

    # Backup existing file/directory if it exists and is not already a symlink
    if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
        backup_path="$HOME/.backups/${item}-$(date +%s)"
        log_info "Backing up existing $target_path to $backup_path"
        mv "$target_path" "$backup_path"
    fi

    # Remove existing symlink if it exists
    if [ -L "$target_path" ]; then
        rm "$target_path"
    fi

    # Create the new symlink
    log_info "Linking $source_path -> $target_path"
    ln -s "$source_path" "$target_path"
done
log_success "Symlinks created successfully."

# --- Step 3: Handle remaining system-wide configs ---
echo_subsection "Deploying system-wide configurations"
# Copy over the remaining non-dotfile configs
log_info "Copying system configs from $MOONARCH_PATH/config/ to $HOME/.config/"
cp -rT "$MOONARCH_PATH/config/" "$HOME/.config/"
log_success "System-wide configurations deployed."