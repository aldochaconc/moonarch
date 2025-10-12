# Set up LazyVim configuration pointing to dotfiles structure
if [[ ! -d "$HOME/.config/nvim" ]]; then
  # Create symlink to dotfiles nvim configuration
  ln -s ~/dotfiles/nvim ~/.config/nvim
fi

# Ensure theme plugin points to dotfiles themes
mkdir -p ~/.config/nvim/lua/plugins
ln -sf ~/dotfiles/themes/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua