# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/omarchy/config/* ~/.config/

# Use zshrc and set as default shell
cp ~/.local/share/omarchy/default/zshrc ~/.zshrc
sudo chsh -s "$(which zsh)" "$USER"
