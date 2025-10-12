# Set links for Nautilius action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Setup dotfiles theme directory structure
mkdir -p ~/dotfiles/themes/current

# Set initial theme (kanagawa in dotfiles)
ln -snf ~/dotfiles/themes/kanagawa ~/dotfiles/themes/current/theme
ln -snf ~/dotfiles/themes/current/theme/backgrounds/1-kanagawa.jpg ~/dotfiles/themes/current/background

# Set specific app links for current theme (pointing to dotfiles)
ln -snf ~/dotfiles/themes/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/dotfiles/themes/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/dotfiles/themes/current/theme/mako.ini ~/.config/mako/config

# Add managed policy directories for Chromium for theme changes
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed
