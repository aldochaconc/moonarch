# Set up LazyVim configuration pointing to dotfiles structure
# The main symlink from ~/dotfiles/nvim to ~/.config/nvim is now
# created by config.sh. This script just ensures the theme plugin is linked.

# Ensure theme plugin points to dotfiles themes
mkdir -p "$HOME/dotfiles/nvim/lua/plugins"
ln -sf "$HOME/dotfiles/themes/current/theme/neovim.lua" "$HOME/dotfiles/nvim/lua/plugins/theme.lua"